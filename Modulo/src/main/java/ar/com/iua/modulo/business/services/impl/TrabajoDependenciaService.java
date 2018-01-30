package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.business.services.Interfaces.ITrabajoDependenciaService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.TrabajoDependencia;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.ITrabajoDependenciaDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 18/09/17.
 */
public class TrabajoDependenciaService extends GenericService<TrabajoDependencia, Integer> implements ITrabajoDependenciaService{

    private static final long serialVersionUID = -6357567873322505552L;
    private static Logger LOG = LoggerFactory.getLogger(TrabajoDependenciaService.class);

    private ITrabajoDependenciaDAO dao;

    public TrabajoDependenciaService(ITrabajoDependenciaDAO dao) {
        super(dao);
        this.dao = dao;
    }

    @Override
    public TrabajoDependencia load(int id) throws ServiceException, NotFoundException {
        try {
            return  dao.load(id);
        }catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
