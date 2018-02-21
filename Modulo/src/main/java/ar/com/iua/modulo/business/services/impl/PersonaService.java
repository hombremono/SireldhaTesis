package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.business.model.PersonaCombos;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.business.services.Interfaces.IPersonaService;
import ar.com.iua.modulo.model.persistence.dao.*;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;


/**
 * Created by mnicolas on 14/05/17.
 */
public class PersonaService extends GenericService<Persona, Integer> implements IPersonaService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PersonaService.class);

    private IPersonaDAO personaDao;
    private ITipoCapacidadConstructivaDAO capacidadConstructivaDAO;
    private IEstadoCivilDAO estadoCivilDAO;
    private IEstudioDAO estudioDAO;
    private INacionalidadDAO nacionalidadDAO;
    private IProfesionDAO profesionDAO;
    private ISexoDAO sexoDAO;
    private ISituacionLaboralDAO situacionLaboralDAO;
    private ITipoDocumentoDAO tipoDocumentoDAO;
    private ILocalidadDAO localidadDAO;
    private IRolFamiliarDAO rolFamiliarDAO;
    private ISubsidioDAO subsidioDAO;
    private ISituacionesEspecialesDAO situacionesEspecialesDAO;
    private IDiscapacidadDAO discapacidadDAO;



    public PersonaService(IPersonaDAO personaDao, ITipoCapacidadConstructivaDAO capacidadConstructivaDAO,
                          IEstadoCivilDAO estadoCivilDAO, IEstudioDAO estudioDAO, INacionalidadDAO nacionalidadDAO,
                          IProfesionDAO profesionDAO, ISexoDAO sexoDAO, ISituacionLaboralDAO situacionLaboralDAO,
                          ITipoDocumentoDAO tipoDocumentoDAO, ILocalidadDAO localidadDAO, IRolFamiliarDAO rolFamiliarDAO,
                          ISubsidioDAO subsidioDAO, ISituacionesEspecialesDAO situacionesEspecialesDAO, IDiscapacidadDAO discapacidadDAO) {
        super(personaDao);
        this.personaDao = personaDao;
        this.capacidadConstructivaDAO = capacidadConstructivaDAO;
        this.estadoCivilDAO = estadoCivilDAO;
        this.estudioDAO = estudioDAO;
        this.nacionalidadDAO = nacionalidadDAO;
        this.profesionDAO = profesionDAO;
        this.sexoDAO = sexoDAO;
        this.situacionLaboralDAO = situacionLaboralDAO;
        this.tipoDocumentoDAO = tipoDocumentoDAO;
        this.localidadDAO = localidadDAO;
        this.rolFamiliarDAO = rolFamiliarDAO;
        this.subsidioDAO = subsidioDAO;
        this.situacionesEspecialesDAO = situacionesEspecialesDAO;
        this.discapacidadDAO = discapacidadDAO;
    }

    @Override
    public Persona load(int id, boolean getInactive) throws ServiceException, NotFoundException {
        try {
            Persona target = personaDao.load(id);
            if(target.isActive() || getInactive){
                return target;
            } else {
                throw new NotFoundException();
            }
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public void setInactive(int id) throws ServiceException, NotFoundException {
        try {
            Persona target = personaDao.load(id);
            target.setActive(false);
            personaDao.update(target);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public PersonaCombos loadCombos() throws ServiceException {
        try {
            PersonaCombos combos =
                    new PersonaCombos(tipoDocumentoDAO.list(),
                            sexoDAO.list(),estadoCivilDAO.list(),
                            nacionalidadDAO.list(),estudioDAO.list(),
                            profesionDAO.list(),capacidadConstructivaDAO.list(),
                            situacionLaboralDAO.list(),localidadDAO.list(),rolFamiliarDAO.list(),
                            discapacidadDAO.list());
            return combos;
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public List<Persona> getByDni(String dni) throws ServiceException, NotFoundException {
        try {
            List<Persona> Personas = personaDao.searchByCriteria(Restrictions.eq("nroDocumento", dni));
            return  Personas;
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}

