package ar.com.iua.modulo.model.business;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;

/**
 * Created by mnicolas on 14/06/17.
 */
public interface IFamiliaService extends IGenericService<Familia, Integer> {
    public Familia load(int id) throws ServiceException, NotFoundException;
}