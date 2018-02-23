package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.model.*;

/**
 * Created by mnicolas on 16/01/18.
 */
public interface IPlanService extends IGenericService<Plan, Integer> {

    public PlanCombos getCombos() throws ServiceException;
    public Plan_RangoEdad getRangoEdad(int id) throws ServiceException;
    public CareceVivienda getCarecimiento(int idFamilia) throws ServiceException;
    public Inmueble getInmuebleByFamilia(int idFamilia) throws ServiceException;
    public InstalacionInmueble getInstalacionBySeveridad (int severidad) throws ServiceException;

}
