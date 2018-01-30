package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.services.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;

import java.util.List;

/**
 * Created by mnicolas on 14/06/17.
 */
public interface IFamiliaService extends IGenericService<Familia, Integer>, INoDeleteService {
    public Familia load(int id, boolean getInactive) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
    public List<Persona> getIntegrantes(int id) throws ServiceException,NotFoundException;
}