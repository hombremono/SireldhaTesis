package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.PersonaCombos;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;

/**
 * Created by mnicolas on 14/05/17.
 */
public interface IPersonaService extends IGenericService<Persona, Integer>,INoDeleteService {
    public Persona load(int id,boolean getInactive) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
    public PersonaCombos loadCombos() throws ServiceException;
}
