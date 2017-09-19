package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.Terreno;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 19/09/17.
 */
public interface ITerrenoService extends IGenericService<Terreno, Integer> {
    public Terreno load(int id) throws ServiceException, NotFoundException;
}
