package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.exception.NotFoundException;

import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */
public interface ISolucionHabitacionalService extends IGenericService<SolucionHabitacional, Integer>{
    public List<SolucionHabitacional> list() throws ServiceException;
}
