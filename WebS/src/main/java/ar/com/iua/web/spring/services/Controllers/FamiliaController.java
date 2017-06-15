package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.business.IFamiliaService;
import ar.com.iua.web.spring.GenericController;
import ar.com.iua.web.spring.services.Constantes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 14/06/17.
 */

@RestController
@RequestMapping(value = Constantes.URL_FAMILIA)
public class FamiliaController extends GenericController {

    @Autowired
    private IFamiliaService familiaService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException {
        return  load(id,familiaService);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Familia familia) throws IOException {
        return add(familia,familiaService,Constantes.URL_FAMILIA);

    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Familia familia) throws IOException {
        return update(familia,familiaService);
    }
}