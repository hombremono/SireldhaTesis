package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.model.*;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.*;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.criterion.Restrictions;

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
    private ICareceViviendaDAO careceViviendaDAO;
    private IInmuebleDAO inmuebleDAO;

    public PlanService(IPlanDAO planDAO, IPlanSituacionRegistroDAO planSituacionRegistroDAO, IPlanSituacionHogarDAO planSituacionHogarDAO,
                       ILocalidadDAO localidadDAO, IPlanRangoEdadDAO planRangoEdadDAO, ISexoDAO sexoDAO,
                       INacionalidadDAO nacionalidadDAO, IEstadoCivilDAO estadoCivilDAO,
                       ISituacionLaboralDAO situacionLaboralDAO, ITipoCapacidadConstructivaDAO capacidadConstructivaDAO,
                       IPlanCaracteristicasHogarDAO caracteristicasHogarDAO, IPoseeInmuebleDAO poseeInmuebleDAO,
                       ISituacionInmuebleDAO situacionInmuebleDAO, IPlanCalmatDAO planCalmatDAO,
                       IInstalacionInmuebleDAO instalacionInmuebleDAO,
                       IPlanSituacionHabitacionalDAO planSituacionHabitacionalDAO,
                       IOrigenFinanciamientoDAO origenFinanciamientoDAO,
                       IPlanCriterioDAO planCriterioDAO, ICareceViviendaDAO careceViviendaDAO, IInmuebleDAO inmuebleDAO) {
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
        this.careceViviendaDAO = careceViviendaDAO;
        this.inmuebleDAO = inmuebleDAO;
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

    public Plan_RangoEdad getRangoEdad(int constanteId) throws ServiceException {
        try {
            List<Plan_RangoEdad> rangos = this.planRangoEdadDAO.searchByCriteria(Restrictions.eq("constante.id", constanteId));
            return rangos.get(0);
        } catch (PersistenceException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }
    }

    public CareceVivienda getCarecimiento(int idFamilia) throws ServiceException {
        try {
            List<CareceVivienda> carecimiento = this.careceViviendaDAO.searchByCriteria(Restrictions.eq("familia.id", idFamilia));
            if (carecimiento.size() > 0)
            {
                return carecimiento.get(0);
            }
            return null;
        } catch (PersistenceException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }
    }

    public Inmueble getInmuebleByFamilia(int idFamilia) throws ServiceException {
        try {
            List<Inmueble> inmueble = this.inmuebleDAO.searchByCriteria(Restrictions.eq("familia.id", idFamilia));
            if (inmueble.size() > 0)
            {
                return inmueble.get(0);
            }
            return null;
        } catch (PersistenceException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }
    }

    public InstalacionInmueble getInstalacionBySeveridad (int severidad) throws ServiceException {
        try {
            List<InstalacionInmueble> instalacion = this.instalacionInmuebleDAO.searchByCriteria(Restrictions.eq("severidad", severidad));
            if (instalacion.size() > 0)
            {
                return instalacion.get(0);
            }
            return null;
        } catch (PersistenceException e) {
            LOG.error(e.getMessage(), e);
            throw new ServiceException(e.getMessage(), e);
        }
    }


}
