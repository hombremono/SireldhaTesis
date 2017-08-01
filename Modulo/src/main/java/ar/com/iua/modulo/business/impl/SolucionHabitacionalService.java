package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.ISolucionHabitacionalService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.ISolucionHabitacionalDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */
public class SolucionHabitacionalService extends GenericService<SolucionHabitacional, Integer> implements ISolucionHabitacionalService{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(DireccionService.class);

    private ISolucionHabitacionalDAO dao;

    public SolucionHabitacionalService(ISolucionHabitacionalDAO dao){
        super(dao);
        this.dao = dao;
    }


    @Override
    public List<SolucionHabitacional> list() throws ServiceException {
        try {
            return dao.list();
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

}
