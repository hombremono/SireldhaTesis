package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Telefono;

/**
 * Created by mnicolas on 06/06/17.
 */
public interface ITelefonoService extends IGenericService<Telefono,Integer> {
    public Telefono load(int id) throws ServiceException, NotFoundException;
}
