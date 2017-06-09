package ar.com.iua.modulo.model.business.impl;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.impl.GenericService;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.business.IDireccionService;
import ar.com.iua.modulo.model.persistence.dao.IDireccionDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 04/06/17.
 */
public class DireccionService extends GenericService<Direccion, Integer> implements IDireccionService {

    private static final long serialVersionUID = -6357567873322505552L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private IDireccionDAO dao;

    public DireccionService(IDireccionDAO dao) {
        super(dao);
        this.dao = dao;
    }



    @Override
    public Direccion load(int id) throws ServiceException, NotFoundException {
        try {
            return dao.load(id);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
