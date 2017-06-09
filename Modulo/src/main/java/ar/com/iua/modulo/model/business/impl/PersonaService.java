package ar.com.iua.modulo.model.business.impl;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.impl.GenericService;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.business.IPersonaService;
import ar.com.iua.modulo.model.persistence.dao.IPersonaDAO;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.rmi.runtime.Log;

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
    public Persona load(int id) throws ServiceException, NotFoundException {
        try {
            return dao.load(id);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
