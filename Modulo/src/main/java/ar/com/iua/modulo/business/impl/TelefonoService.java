package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.business.Interfaces.ITelefonoService;
import ar.com.iua.modulo.model.persistence.dao.ITelefonoDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 06/06/17.
 */
public class TelefonoService extends GenericService<Telefono, Integer> implements ITelefonoService {

    private static final long serialVersionUID = -6357567873322505552L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private ITelefonoDAO dao;

    public TelefonoService(ITelefonoDAO dao){
        super(dao);
        this.dao = dao;
    }



    @Override
    public Telefono load(int id) throws ServiceException, NotFoundException {
        try {
            return  dao.load(id);
        }catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
