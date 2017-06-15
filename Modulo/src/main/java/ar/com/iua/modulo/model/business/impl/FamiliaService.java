package ar.com.iua.modulo.model.business.impl;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.impl.GenericService;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.business.IFamiliaService;
import ar.com.iua.modulo.model.persistence.dao.IFamiliaDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 14/06/17.
 */
public class FamiliaService extends GenericService<Familia, Integer> implements IFamiliaService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private IFamiliaDAO dao;

    public FamiliaService(IFamiliaDAO dao){
        super(dao);
        this.dao = dao;
    }


    @Override
    public Familia load(int id) throws ServiceException, NotFoundException {
        try {
            return dao.load(id);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}