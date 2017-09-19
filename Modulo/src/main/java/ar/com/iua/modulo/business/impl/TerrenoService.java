package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.ITerrenoService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.Terreno;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.ITerrenoDao;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/09/17.
 */
public class TerrenoService extends GenericService<Terreno, Integer> implements ITerrenoService {

    private static final long serialVersionUID = -6357567873322505552L;
    private static Logger LOG = LoggerFactory.getLogger(TerrenoService.class);

    private ITerrenoDao dao;

    public TerrenoService(ITerrenoDao dao) {
        super(dao);
        this.dao = dao;
    }



    @Override
    public Terreno load(int id) throws ServiceException, NotFoundException {
        try {
            return dao.load(id);
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
