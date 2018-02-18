package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.plan.operaciones.OperadorDocumentacionCompleta;
import ar.com.iua.modulo.business.services.Interfaces.IContantesPlanService;
import ar.com.iua.modulo.business.services.Interfaces.IFamiliaService;
import ar.com.iua.modulo.model.ConstantePlan;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.web.spring.services.PlanOperacionFactory;
import ar.com.iua.modulo.business.plan.operaciones.IOperadorPlan;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Plan;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.ConstantesURL;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mnicolas on 16/01/18.
 */
@RestController
@RequestMapping(value = ConstantesURL.URL_PLAN)
public class PlanController extends GenericController{
    protected static Logger LOG = LoggerFactory.getLogger(PlanController.class);

    @Autowired
    private IPlanService planService;

    @Autowired
    private IContantesPlanService constantePlanService;

    @Autowired
    private IFamiliaService familiaService;



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
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<Object> getAll () throws IOException {
        try {
            List<Plan> planes = planService.list();
            return new ResponseEntity<Object>(planes ,HttpStatus.OK);
        } catch (ServiceException e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
//        return add(plan, planService, ConstantesURL.URL_PLAN);
    }

    @PreAuthorize("hasAuthority('ROLE_PLAN') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/ejecutar/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> ejecutar (@PathVariable int id) throws IOException{
        try {
            Plan plan = planService.load(id);
            List<Familia> familias = familiaService.list();//get familias
            List<PlanResultado> listaFamilia = new ArrayList<PlanResultado>();
            List<PlanResultado> resultados = listaFamilia;

            for (Familia familia : familias) {
                resultados.add(new PlanResultado(familia, familiaService.getIntegrantes(familia.getId_Familia()), plan));
            }
            for (Plan_Criterio criterio : plan.getPlanCriterioList()) {
                ConstantePlan constantePlan = constantePlanService.load(criterio.getConstante().getId());
                IOperadorPlan operador = PlanOperacionFactory.getInstance().getOperador(constantePlan);
                resultados = operador.ejecutar(criterio,resultados);
            }

            return new ResponseEntity<Object>(resultados,HttpStatus.OK);
        } catch (ServiceException e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (NotFoundException e) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        }

    }
}
