package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.Interfaces.IPlanService;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.model.Plan;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.Constantes;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 16/01/18.
 */
@RestController
@RequestMapping(value = Constantes.URL_PLAN)
public class PlanController extends GenericController{
    protected static Logger LOG = LoggerFactory.getLogger(PlanController.class);

    @Autowired
    private IPlanService planService;


    @PreAuthorize("hasAuthority('ROLE_PLAN') or hasAuthority('ROLE_ADMIN')")
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

    @PreAuthorize("hasAuthority('ROLE_PLAN') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException{
        try {
            Plan target = planService.load(id);
            return new ResponseEntity<Object>(target ,HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_PLAN') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Plan plan) throws IOException {
        return add(plan, planService, Constantes.URL_PLAN);
    }
}
