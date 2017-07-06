package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.business.Interfaces.IFamiliaService;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
        try {
            Familia target = familiaService.load(id);
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

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Familia familia) throws IOException {
        return add(familia,familiaService,Constantes.URL_FAMILIA);

    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Familia familia) throws IOException {
        return update(familia,familiaService);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> delte (@PathVariable int id) throws IOException {
        return setInactive(id,familiaService);
    }
}