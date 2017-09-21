package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.ITelefonoService;
import ar.com.iua.modulo.business.model.PersonaCombos;
import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.business.Interfaces.IPersonaService;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 08/06/17.
 */
@RestController
@RequestMapping(value = Constantes.URL_PERSONA)
public class PersonaController extends GenericController {

    @Autowired
    private IPersonaService personaService;
    @Autowired
    private ITelefonoService telefonoService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException{
        try {
            Persona target = personaService.load(id,false);
            return new ResponseEntity<Object>(target ,HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Persona persona) throws IOException {
        Telefono telefono = persona.getTelefono();
        try {
            if(telefono.getId_Telefono() <= 0) {
                telefono.setActive(true);
                persona.setTelefono(telefonoService.saveOrUpdate(telefono));
            }
        }catch (Exception e){
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }


        return add(persona,personaService,Constantes.URL_PERSONA);

    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Persona persona) throws IOException {
        return update(persona,personaService);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> delete (@PathVariable int id) throws IOException {
        return setInactive(id,personaService);
    }

    @RequestMapping(value = "/loadCombos", method = RequestMethod.GET)
    public ResponseEntity<Object> loadCombos () throws IOException {
        try {
            PersonaCombos target =  personaService.loadCombos();
            return new ResponseEntity<Object>(target , HttpStatus.OK);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



}
