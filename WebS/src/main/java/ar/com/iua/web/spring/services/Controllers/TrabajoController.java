package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.IDireccionService;
import ar.com.iua.modulo.business.Interfaces.ITelefonoService;
import ar.com.iua.modulo.business.Interfaces.ITrabajoAutonomoService;
import ar.com.iua.modulo.business.Interfaces.ITrabajoDependenciaService;
import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.model.TrabajoAutonomo;
import ar.com.iua.modulo.model.TrabajoDependencia;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 18/09/17.
 */

@RestController
@RequestMapping(value = Constantes.URL_TRABAJO)
public class TrabajoController extends GenericController {

    @Autowired
    private ITrabajoAutonomoService trabajoAutonomoService;
    @Autowired
    private ITrabajoDependenciaService trabajoDependenciaService;
    @Autowired
    private IDireccionService dirService;
    @Autowired
    private ITelefonoService telService;

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/autonomo/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadAutonomo (@PathVariable int id) throws IOException {
        try {
            TrabajoAutonomo target = trabajoAutonomoService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/autonomo", method = RequestMethod.POST)
    public ResponseEntity<Object> addAutonomo (@RequestBody TrabajoAutonomo trabajoAutonomo) throws IOException {

        return add(trabajoAutonomo, trabajoAutonomoService, Constantes.URL_TRABAJO);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/autonomo", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateAutonomo (@RequestBody TrabajoAutonomo trabajoAutonomo) throws IOException {
        return update(trabajoAutonomo, trabajoAutonomoService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/autonomo/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteAutonomo (@PathVariable int id) throws IOException {
        try {
            TrabajoAutonomo target = trabajoAutonomoService.load(id);
            target.setActive(false);
            trabajoAutonomoService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/dependencia/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadDependencia (@PathVariable int id) throws IOException {
        try {
            TrabajoDependencia target = trabajoDependenciaService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/dependencia", method = RequestMethod.POST)
    public ResponseEntity<Object> addDependencia (@RequestBody TrabajoDependencia trabajoDependencia) throws IOException {
        Telefono telefono = trabajoDependencia.getTelefono();
        Direccion direccion = trabajoDependencia.getDireccion();
        try {
            if(telefono.getId_Telefono() <= 0) {
                telefono.setActive(true);
                trabajoDependencia.setTelefono(telService.saveOrUpdate(telefono));
            }
            if(direccion.getId_Direccion() <= 0) {
                direccion.setisActive(true);
                trabajoDependencia.setDireccion(dirService.saveOrUpdate(direccion));
            }
        }catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return add(trabajoDependencia, trabajoDependenciaService, Constantes.URL_TRABAJO);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/dependencia", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateDependencia (@RequestBody TrabajoDependencia trabajoDependencia) throws IOException {
        return update(trabajoDependencia, trabajoDependenciaService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/dependencia/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteTelDependencia (@PathVariable int id) throws IOException {
        try {
            TrabajoDependencia target = trabajoDependenciaService.load(id);
            target.setActive(false);
            trabajoDependenciaService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
