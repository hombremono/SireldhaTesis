package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;

/**
 * Created by mnicolas on 14/06/17.
 */
public interface IFamiliaService extends IGenericService<Familia, Integer>, INoDeleteService {
    public Familia load(int id, boolean getInactive) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
}