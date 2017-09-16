package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.InmuebleCombos;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 16/09/17.
 */
public interface IInmuebleService extends IGenericService<Inmueble, Integer>, INoDeleteService {
    public Inmueble load(int id, boolean getInactive) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
    public InmuebleCombos getCombos() throws ServiceException;
}
