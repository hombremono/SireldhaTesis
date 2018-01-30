package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Direccion;

/**
 * Created by mnicolas on 04/06/17.
 */
public interface IDireccionService extends IGenericService<Direccion, Integer> {
    public Direccion load(int id) throws ServiceException, NotFoundException;
}
