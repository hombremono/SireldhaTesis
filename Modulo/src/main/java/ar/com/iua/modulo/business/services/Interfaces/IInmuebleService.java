package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.services.Interfaces.Generic.INoDeleteService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.business.model.InmuebleCombos;
import ar.com.iua.modulo.model.Cocina;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.PoseeBano;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 16/09/17.
 */
public interface IInmuebleService extends IGenericService<Inmueble, Integer>, INoDeleteService {
//    public Inmueble loadComplete(int id) throws ServiceException, NotFoundException;
    public void setInactive(int id) throws ServiceException, NotFoundException;
    public InmuebleCombos getCombos() throws ServiceException;
    public Cocina saveCocina(Cocina cocina) throws ServiceException;
    public PoseeBano saveBano(PoseeBano bano) throws ServiceException;
}
