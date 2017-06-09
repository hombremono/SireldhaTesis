package ar.com.iua.web.spring.services;

import ar.com.iua.modulo.model.business.IPersonaService;
import ar.com.iua.web.spring.GenericController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
}
