package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.IHogarService;
import ar.com.iua.modulo.business.model.HogarCombos;
import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */

@RestController
@RequestMapping(value = Constantes.URL_HOGAR)
public class HogarController {
    protected static Logger LOG = LoggerFactory.getLogger(HogarController.class);

    @Autowired
    private IHogarService hogarService;

    @RequestMapping(value = "/loadCombos", method = RequestMethod.GET)
    public ResponseEntity<Object> loadCombos () throws IOException {
        try {
            HogarCombos target =  hogarService.getCombos();
            return new ResponseEntity<Object>(target , HttpStatus.OK);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}
