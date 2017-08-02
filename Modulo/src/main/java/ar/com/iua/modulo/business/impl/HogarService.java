package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.IHogarService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.HogarCombos;
import ar.com.iua.modulo.model.Localidad;
import ar.com.iua.modulo.model.SituacionInmueble;
import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.persistence.dao.ILocalidadDAO;
import ar.com.iua.modulo.model.persistence.dao.ISituacionInmuebleDAO;
import ar.com.iua.modulo.model.persistence.dao.ISolucionHabitacionalDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */
public class HogarService  implements IHogarService {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOGSH = LoggerFactory.getLogger(SolucionHabitacional.class);
    private static Logger LOGSI = LoggerFactory.getLogger(SituacionInmueble.class);

    private ISolucionHabitacionalDAO solucionHabitacionalDao;
    private ISituacionInmuebleDAO situacionInmuebleDao;
    private ILocalidadDAO localidadDao;

    public HogarService(ISolucionHabitacionalDAO daoSH,ISituacionInmuebleDAO daoSI,ILocalidadDAO daoL){
        this.solucionHabitacionalDao = daoSH;
        this.situacionInmuebleDao = daoSI;
        this.localidadDao = daoL;
    }



    @Override
    public List<SolucionHabitacional> listSolucionHabitacional() throws ServiceException {
        try {
            return solucionHabitacionalDao.list();
        } catch (PersistenceException e){
            LOGSH.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public List<SituacionInmueble> listSolucionSituacionInmueble() throws ServiceException {
        try {
            return situacionInmuebleDao.list();
        } catch (PersistenceException e){
            LOGSI.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }

    @Override
    public List<Localidad> listLocalidad() throws ServiceException {
        return null;
    }

    @Override
    public HogarCombos getCombos() throws ServiceException {
        try {
            HogarCombos combos =
                    new HogarCombos(solucionHabitacionalDao.list(),situacionInmuebleDao.list(),localidadDao.list());
            return combos;
        } catch (PersistenceException e){
            LOGSI.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
