package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.IPlanService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.model.Plan;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.*;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by mnicolas on 16/01/18.
 */
public class PlanService extends GenericService<Plan, Integer> implements IPlanService {
    private static final long serialVersionUID = 1206356050999505599L;

    private IPlanSituacionRegistroDAO planSituacionRegistroDAO;
    private IPlanSituacionHogarDAO planSituacionHogarDAO;
    private ILocalidadDAO localidadDAO;
    private IPlanRangoEdadDAO planRangoEdadDAO;
    private ISexoDAO sexoDAO;
    private INacionalidadDAO nacionalidadDAO;
    private IEstadoCivilDAO estadoCivilDAO;
    private ISituacionLaboralDAO situacionLaboralDAO;
    private ITipoCapacidadConstructivaDAO capacidadConstructivaDAO;
    private IPlanCaracteristicasHogarDAO caracteristicasHogarDAO;
    private IPoseeInmuebleDAO poseeInmuebleDAO;
    private ISituacionInmuebleDAO situacionInmuebleDAO;
    private IPlanCalmatDAO planCalmatDAO;
    private IInstalacionInmuebleDAO instalacionInmuebleDAO;
    private IPlanSituacionHabitacionalDAO planSituacionHabitacionalDAO;
    private IOrigenFinanciamientoDAO origenFinanciamientoDAO;
    private IPlanCriterioDAO planCriterioDAO;

    public PlanService(IPlanDAO planDAO, IPlanSituacionRegistroDAO planSituacionRegistroDAO, IPlanSituacionHogarDAO planSituacionHogarDAO,
                       ILocalidadDAO localidadDAO, IPlanRangoEdadDAO planRangoEdadDAO, ISexoDAO sexoDAO,
                       INacionalidadDAO nacionalidadDAO, IEstadoCivilDAO estadoCivilDAO,
                       ISituacionLaboralDAO situacionLaboralDAO, ITipoCapacidadConstructivaDAO capacidadConstructivaDAO,
                       IPlanCaracteristicasHogarDAO caracteristicasHogarDAO, IPoseeInmuebleDAO poseeInmuebleDAO,
                       ISituacionInmuebleDAO situacionInmuebleDAO, IPlanCalmatDAO planCalmatDAO,
                       IInstalacionInmuebleDAO instalacionInmuebleDAO,
                       IPlanSituacionHabitacionalDAO planSituacionHabitacionalDAO,
                       IOrigenFinanciamientoDAO origenFinanciamientoDAO,
                       IPlanCriterioDAO planCriterioDAO) {
        super(planDAO);
        this.planSituacionRegistroDAO = planSituacionRegistroDAO;
        this.planSituacionHogarDAO = planSituacionHogarDAO;
        this.localidadDAO = localidadDAO;
        this.planRangoEdadDAO = planRangoEdadDAO;
        this.sexoDAO = sexoDAO;
        this.nacionalidadDAO = nacionalidadDAO;
        this.estadoCivilDAO = estadoCivilDAO;
        this.situacionLaboralDAO = situacionLaboralDAO;
        this.capacidadConstructivaDAO = capacidadConstructivaDAO;
        this.caracteristicasHogarDAO = caracteristicasHogarDAO;
        this.poseeInmuebleDAO = poseeInmuebleDAO;
        this.situacionInmuebleDAO = situacionInmuebleDAO;
        this.planCalmatDAO = planCalmatDAO;
        this.instalacionInmuebleDAO = instalacionInmuebleDAO;
        this.planSituacionHabitacionalDAO = planSituacionHabitacionalDAO;
        this.origenFinanciamientoDAO = origenFinanciamientoDAO;
        this.planCriterioDAO = planCriterioDAO;
    }

    @Override
    public PlanCombos getCombos() throws ServiceException {
        try {
            PlanCombos combos =
                    new PlanCombos(planSituacionRegistroDAO.list(),planSituacionHogarDAO.list(),localidadDAO.list(),
                            planRangoEdadDAO.list(),sexoDAO.list(),nacionalidadDAO.list(),estadoCivilDAO.list(),
                            situacionLaboralDAO.list(),capacidadConstructivaDAO.list(),caracteristicasHogarDAO.list(),
                            poseeInmuebleDAO.list(),situacionInmuebleDAO.list(),planCalmatDAO.list(),
                            instalacionInmuebleDAO.list(),planSituacionHabitacionalDAO.list(),
                            origenFinanciamientoDAO.list());
            return combos;
        } catch (PersistenceException e){
            throw new ServiceException(e.getMessage(),e);
        }
    }


    @Override
    public Plan saveOrUpdate(Plan plan) throws ServiceException {
        try {
            List<Plan_Criterio> criteriosList = new ArrayList<>();
            plan.setFechaAlta(new Date());
            Plan targetPlan = dao.saveOrUpdate(plan);
            for (Plan_Criterio criterio : plan.getPlanCriterioList()) {
                criterio.setPlan(targetPlan);
                criteriosList.add(planCriterioDAO.saveOrUpdate(criterio));
            }
            plan.setPlanCriterioList(criteriosList);
            return dao.load(targetPlan.getId());
        } catch (PersistenceException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }  catch (NotFoundException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }
    }


}
