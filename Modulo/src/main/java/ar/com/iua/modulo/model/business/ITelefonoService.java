package ar.com.iua.modulo.model.business;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Telefono;

/**
 * Created by mnicolas on 06/06/17.
 */
public interface ITelefonoService extends IGenericService<Telefono,Integer>{
    public Telefono load(int id) throws ServiceException, NotFoundException;
}
