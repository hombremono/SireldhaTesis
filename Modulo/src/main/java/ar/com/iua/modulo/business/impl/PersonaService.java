package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.business.Interfaces.IPersonaService;
import ar.com.iua.modulo.model.persistence.dao.IPersonaDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * Created by mnicolas on 14/05/17.
 */
public class PersonaService extends GenericService<Persona, Integer> implements IPersonaService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private IPersonaDAO dao;

    public PersonaService(IPersonaDAO dao){
        super(dao);
        this.dao = dao;
    }


    @Override
    public Persona load(int id, boolean getInactive) throws ServiceException, NotFoundException {
        try {
            Persona target = dao.load(id);
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
            Persona target = dao.load(id);
            target.setActive(false);
            dao.update(target);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }




    }

}
