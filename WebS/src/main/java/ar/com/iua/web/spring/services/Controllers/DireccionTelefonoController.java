package ar.com.iua.web.spring.services.Controllers;
import ar.com.iua.web.spring.services.Constantes;

import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.Localidad;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.model.business.IDireccionService;
import ar.com.iua.modulo.model.business.ITelefonoService;
import ar.com.iua.web.spring.GenericController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URI;

/**
 * Created by mnicolas on 04/06/17.
 */
@RestController
@RequestMapping(value = Constantes.URL_DIRTEL)
public class DireccionTelefonoController extends GenericController{


    @Autowired
    private IDireccionService dirService;
    @Autowired
    private ITelefonoService  telService;

    //----------DIRECCION----------
    @RequestMapping(value = "/direccion/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadDir (@PathVariable int id) throws IOException {
        return load(id,dirService);
    }

    @RequestMapping(value = "/direccion/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteDir (@PathVariable int id) throws IOException {
        return delete(id,dirService);
    }

    @RequestMapping(value = "/direccion", method = RequestMethod.POST)
    public ResponseEntity<Object> addDir (@RequestBody Direccion direccion) throws IOException {
        return add(direccion,dirService,Constantes.URL_DIRTEL);
    }

    @RequestMapping(value = "/direccion", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateDir (@RequestBody Direccion direccion) throws IOException {
        return update(direccion,dirService);
    }


    //----------TELEFONO-----------

    @RequestMapping(value = "/telefono/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadTel (@PathVariable int id) throws IOException {
        return load(id,telService);
    }

    @RequestMapping(value = "/telefono/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteTel (@PathVariable int id) throws IOException {
        return delete(id,telService);
    }

    @RequestMapping(value = "/telefono", method = RequestMethod.POST)
    public ResponseEntity<Object> addTel (@RequestBody Telefono telefono) throws IOException {
        return add(telefono,telService, Constantes.URL_DIRTEL);
    }

    @RequestMapping(value = "/telefono", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateTel (@RequestBody Telefono telefono) throws IOException {
        return update(telefono,telService);
    }


}
