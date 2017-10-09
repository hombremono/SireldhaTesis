package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.ICapacidadConstructivaService;
import ar.com.iua.modulo.business.Interfaces.ITerrenoService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.CapacidadConstructiva;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.ICapacidadConstructivaDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 08/10/17.
 */
public class CapacidadConstructivaService extends GenericService<CapacidadConstructiva, Integer> implements ICapacidadConstructivaService {

    private static final long serialVersionUID = -6357567873322505552L;
    private static Logger LOG = LoggerFactory.getLogger(CapacidadConstructivaService.class);

    private ICapacidadConstructivaDAO dao;

    public CapacidadConstructivaService(ICapacidadConstructivaDAO dao) {
        super(dao);
        this.dao = dao;
    }


    @Override
    public CapacidadConstructiva load(int id) throws ServiceException, NotFoundException {
        try {
            return dao.load(id);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
