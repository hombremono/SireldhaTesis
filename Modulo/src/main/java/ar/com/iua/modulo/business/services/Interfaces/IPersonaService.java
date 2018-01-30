package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.services.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.business.model.PersonaCombos;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Persona;

import java.util.List;

/**
 * Created by mnicolas on 14/05/17.
 */
public interface IPersonaService extends IGenericService<Persona, Integer>,INoDeleteService {
    public Persona load(int id,boolean getInactive) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
    public PersonaCombos loadCombos() throws ServiceException;
    public List<Persona> getByDni(String dni) throws ServiceException, NotFoundException;
}
