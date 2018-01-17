package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.IPlanService;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * Created by mnicolas on 16/01/18.
 */
@RestController
@RequestMapping(value = Constantes.URL_PLAN)
public class PlanController {
    protected static Logger LOG = LoggerFactory.getLogger(PlanController.class);
    @Autowired
    private IPlanService planService;

    @RequestMapping(value = "/loadCombos", method = RequestMethod.GET)
    public ResponseEntity<Object> loadCombos () throws IOException {
        try {
            PlanCombos target =  planService.getCombos();
            return new ResponseEntity<Object>(target , HttpStatus.OK);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
