package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.HogarCombos;
import ar.com.iua.modulo.model.Localidad;
import ar.com.iua.modulo.model.SituacionInmueble;
import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.exception.NotFoundException;

import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */
public interface IHogarService {
    public List<SolucionHabitacional> listSolucionHabitacional() throws ServiceException;
    public List<SituacionInmueble> listSolucionSituacionInmueble() throws ServiceException;
    public List<Localidad> listLocalidad() throws ServiceException;
    public HogarCombos getCombos() throws ServiceException;
}
