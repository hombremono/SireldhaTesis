package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.business.IPersonaService;
import ar.com.iua.web.spring.GenericController;
import ar.com.iua.web.spring.services.Constantes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 08/06/17.
 */
@RestController
@RequestMapping(value = Constantes.URL_PERSONA)
public class PersonaController extends GenericController{

    @Autowired
    private IPersonaService personaService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException{
        return  load(id,personaService);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Persona persona) throws IOException {
        return add(persona,personaService,Constantes.URL_PERSONA);

    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Persona persona) throws IOException {
        return update(persona,personaService);
    }
}
