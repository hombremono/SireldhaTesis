package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.ICapacidadConstructivaService;
import ar.com.iua.modulo.business.Interfaces.ITelefonoService;
import ar.com.iua.modulo.business.model.PersonaCombos;
import ar.com.iua.modulo.model.CapacidadConstructiva;
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
import java.util.ArrayList;
import java.util.List;

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
    @Autowired
    private ICapacidadConstructivaService capacidadConstructivaService;

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
            List<Persona> listaPersonas  = personaService.getByDni(persona.getNroDocumento());
            if (!listaPersonas.isEmpty() && persona.getId() <= 0){
                return new ResponseEntity<Object>(new SimpleResponse(-1, "La persona con el nro de " +
                        "documento que esta tratando de cargar ya se encuentra en la base de datos"), HttpStatus.CONFLICT);
               // persona.setId_Persona(listaPersonas.get(0).getId_Persona());
            }
            if(telefono != null && telefono.getId_Telefono() <= 0 && telefono.getNumero() != null) {
                telefono.setActive(true);
                persona.setTelefono(telefonoService.saveOrUpdate(telefono));
            } else {
                persona.setTelefono(null);
            }
            Persona response = personaService.saveOrUpdate(persona);



            List<CapacidadConstructiva> capacidadesContructivas = persona.getCapacidadesConstructivas();
            if(!capacidadesContructivas.isEmpty()){
                List<CapacidadConstructiva> nuevaListaCC = new ArrayList<CapacidadConstructiva>();
                for (CapacidadConstructiva capacidadConstructiva:capacidadesContructivas){
                    capacidadConstructiva.setPersona(response);
                    nuevaListaCC.add(capacidadConstructivaService.saveOrUpdate(capacidadConstructiva));
                }
                persona.setCapacidadesConstructivas(nuevaListaCC);
            }
            return new ResponseEntity<Object>(response, HttpStatus.CREATED);
        }catch (Exception e){
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Persona persona) throws IOException {
        Telefono telefono = persona.getTelefono();
        try {
            if(telefono != null && telefono.getId_Telefono() <= 0 && telefono.getNumero() != null) {
                telefono.setActive(true);
                persona.setTelefono(telefonoService.saveOrUpdate(telefono));
            } else {
                persona.setTelefono(null);
            }
        }catch (Exception e){
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
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

    @RequestMapping(value = "/byDni/{dni}", method = RequestMethod.GET)
    public ResponseEntity<Object> getByDni (@PathVariable String dni) throws IOException {
        try {
            List<Persona> target =  personaService.getByDni(dni);
            if(!target.isEmpty()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
        return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
    }
        catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}
