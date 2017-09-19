package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.TrabajoAutonomo;
import ar.com.iua.modulo.model.exception.NotFoundException;

/**
 * Created by mnicolas on 18/09/17.
 */
public interface ITrabajoAutonomoService extends IGenericService<TrabajoAutonomo,Integer> {
    public TrabajoAutonomo load(int id) throws ServiceException, NotFoundException;
}