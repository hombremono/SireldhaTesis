package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 05/07/17.
 */
//@RestController
//@RequestMapping(value = Constantes.URL_INMUEBLE)
public class InmuebleController {

//    @Autowired
//    private IPersonaService personaService;
//
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    public ResponseEntity<Object> load (@PathVariable int id) throws IOException {
//        try {
//            Persona target = personaService.load(id);
//            if(target.isActive()){
//                return new ResponseEntity<Object>(target , HttpStatus.OK);
//            }else  {
//                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
//            }
//        } catch (NotFoundException nfe) {
//            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
//        } catch (Exception e) {
//            LOG.error(e.getMessage(), e);
//            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//    @RequestMapping(value = "/", method = RequestMethod.POST)
//    public ResponseEntity<Object> add (@RequestBody Persona persona) throws IOException {
//        return add(persona,personaService, Constantes.URL_PERSONA);
//
//    }
//
//    @RequestMapping(value = "/", method = RequestMethod.PUT)
//    public ResponseEntity<Object> update (@RequestBody Persona persona) throws IOException {
//        return update(persona,personaService);
//    }
//
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    public ResponseEntity<Object> deleteTel (@PathVariable int id) throws IOException {
//        try {
//            Persona target = personaService.load(id);
//            target.setActive(false);
//            personaService.update(target);
//            return new ResponseEntity<Object>(HttpStatus.OK);
//        } catch (NotFoundException nfe) {
//            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
//        } catch (Exception e) {
//            LOG.error(e.getMessage(), e);
//            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }


}
