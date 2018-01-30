package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.CareceVivienda;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 19/09/17.
 */
public interface ICareceViviendaService extends IGenericService<CareceVivienda, Integer> {
    public CareceVivienda load(int id) throws ServiceException, NotFoundException;
}
