package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.CapacidadConstructiva;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 08/10/17.
 */
public interface ICapacidadConstructivaService extends IGenericService<CapacidadConstructiva,Integer>{
        public CapacidadConstructiva load(int id) throws ServiceException, NotFoundException;
}
