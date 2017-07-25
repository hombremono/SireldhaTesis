package ar.com.iua.modulo.business.Interfaces.Generic;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 05/07/17.
 */
public interface INoDeleteService {
    public void setInactive(int id) throws ServiceException, NotFoundException;
}
