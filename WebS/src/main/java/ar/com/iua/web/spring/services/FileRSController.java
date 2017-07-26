package ar.com.iua.web.spring.services;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Archivo;
import ar.com.iua.modulo.business.Interfaces.IArchivoService;

@RestController

@RequestMapping(value = Constantes.URL_FILES)
public class FileRSController {
	private static Logger LOG = LoggerFactory.getLogger(FileRSController.class);

	// curl -i -F "id=1" -F "file=@/home/mariano/duke-java.jpeg" http://localhost:8080/WebS/api/v1/files/fs

	@RequestMapping(value = "/fs", method = RequestMethod.POST)
	public ResponseEntity<Object> upload(@RequestParam("file") MultipartFile file, @RequestParam("id") int id) {
		String name = "-";
		if (!file.isEmpty()) {
			name = file.getOriginalFilename();
			try {
				File f = File.createTempFile("uploaded", "OK");
				byte[] bytes = file.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(f));
				stream.write(bytes);
				stream.close();
				return new ResponseEntity<Object>(
						new SimpleResponse(0,
								name + " subido!, para id=" + id + " almacenado en " + f.getAbsolutePath()),
						HttpStatus.OK);
			} catch (Exception e) {
				LOG.error(e.getMessage(), e);
				return new ResponseEntity<Object>(
						new SimpleResponse(-1, "Fallo al subir archivo " + name + " => " + e.getMessage()),
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			return new ResponseEntity<Object>(
					new SimpleResponse(-1, "Upload fallido de " + name + ", porque estaba vacío."),
					HttpStatus.INTERNAL_SERVER_ERROR);

		}
	}

	@Autowired
	private IArchivoService archivoService;

	// curl -i -F "id=1" -F "file=@/home/mariano/duke-java.jpeg" http://localhost:8080/WebS/api/v1/files/
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Object> uploadLogic(@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				Archivo archivo = new Archivo();
				archivo.setFecha(new Date());
				archivo.setMimeType(file.getContentType());
				archivo.setSize(file.getSize());
				archivo.setName(file.getOriginalFilename());
				archivo.setArchivo(file.getBytes());
				archivoService.save(archivo);
				HttpHeaders headers = new HttpHeaders();
				headers.setLocation(new URI(Constantes.URL_FILES + "/" + archivo.getIdArchivo()));
				return new ResponseEntity<Object>(headers, HttpStatus.CREATED);
			} catch (Exception e) {
				LOG.error(e.getMessage(), e);
				return new ResponseEntity<Object>(
						new SimpleResponse(-1,
								"Fallo al subir archivo " + file.getOriginalFilename() + " => " + e.getMessage()),
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			return new ResponseEntity<Object>(new SimpleResponse(-1, "Upload fallido, porque estaba vacío."),
					HttpStatus.INTERNAL_SERVER_ERROR);

		}
	}
	// http://localhost:8080/WebS/api/v1/files/1

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> download(@PathVariable("id") int id) {
		Archivo archivo;
		try {
			archivo = archivoService.load(id);
			HttpHeaders respHeaders = new HttpHeaders();
			respHeaders.add("Content-Type",archivo.getMimeType());
			respHeaders.setContentLength(archivo.getSize());
			respHeaders.setContentDispositionFormData("attachment", archivo.getName());

			InputStreamResource isr = new InputStreamResource(new ByteArrayInputStream(archivo.getArchivo()));
			return new ResponseEntity<InputStreamResource>(isr, respHeaders, HttpStatus.OK);
		} catch (ServiceException e) {
			return new ResponseEntity(new SimpleResponse(-1, e.getMessage()),
					HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (NotFoundException e) {
			return new ResponseEntity(new SimpleResponse(-1, e.getMessage()),
					HttpStatus.NOT_FOUND);
		}
		
	}
}
