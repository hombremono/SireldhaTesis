package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.business.services.Interfaces.IFamiliaService;
import ar.com.iua.modulo.model.persistence.dao.IFamiliaDAO;
import ar.com.iua.modulo.model.persistence.dao.IPersonaDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 14/06/17.
 */
public class FamiliaService extends GenericService<Familia, Integer> implements IFamiliaService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private IFamiliaDAO familiaDAO;
    private IPersonaDAO personaDAO;

    public FamiliaService(IFamiliaDAO familiaDAO, IPersonaDAO personaDAO){
        super(familiaDAO);
        this.familiaDAO = familiaDAO;
        this.personaDAO = personaDAO;
    }


    @Override
    public Familia load(int id, boolean getInactive) throws ServiceException, NotFoundException {
        try {
            Familia target = familiaDAO.load(id);
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
            Familia target = familiaDAO.load(id);
            target.setActive(false);
            familiaDAO.update(target);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public List<Persona> getIntegrantes(int id) throws ServiceException {
        try {
            List<Persona> integrantes = personaDAO.searchByCriteria(Restrictions.eq("familia.id", id));
            return  integrantes;
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public Familia getFamiliaByCodigo(String codigoAlta) throws ServiceException, NotFoundException {
        try {
            List<Familia> familia = familiaDAO.searchByCriteria(Restrictions.eq("codigoDeAlta", codigoAlta));
            return  familia.size() > 0 ? familia.get(0) : null ;
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }


}