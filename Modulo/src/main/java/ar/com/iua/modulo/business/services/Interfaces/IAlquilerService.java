package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Alquiler;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 19/09/17.
 */
public interface IAlquilerService extends IGenericService<Alquiler, Integer> {
    public Alquiler load(int id) throws ServiceException, NotFoundException;
}
