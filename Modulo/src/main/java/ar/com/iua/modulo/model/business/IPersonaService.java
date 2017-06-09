package ar.com.iua.modulo.model.business;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;

/**
 * Created by mnicolas on 14/05/17.
 */
public interface IPersonaService extends IGenericService<Persona, Integer> {
    public Persona load(int id) throws ServiceException, NotFoundException;
}
