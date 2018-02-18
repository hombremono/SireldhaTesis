package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.ConstantePlan;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 04/02/18.
 */
public interface IContantesPlanService extends IGenericService<ConstantePlan, Integer> {
    public ConstantePlan load(int id) throws ServiceException, NotFoundException;
}
