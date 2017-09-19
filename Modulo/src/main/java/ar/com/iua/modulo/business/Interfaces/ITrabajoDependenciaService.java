package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.TrabajoDependencia;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 18/09/17.
 */
public interface ITrabajoDependenciaService extends IGenericService<TrabajoDependencia,Integer> {
    public TrabajoDependencia load(int id) throws ServiceException, NotFoundException;
}
