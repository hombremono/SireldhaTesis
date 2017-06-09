package ar.com.iua.modulo.model.business;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Direccion;

/**
 * Created by mnicolas on 04/06/17.
 */
public interface IDireccionService extends IGenericService<Direccion, Integer> {
    public Direccion load(int id) throws ServiceException, NotFoundException;
}
