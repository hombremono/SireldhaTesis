package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.ISituacionesEspecialesService;
import ar.com.iua.modulo.model.SituacionesEspeciales;
import ar.com.iua.modulo.model.persistence.dao.ISituacionesEspecialesDAO;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 07/11/17.
 */
public class SituacionesEspecialesService extends GenericService<SituacionesEspeciales, Integer>
        implements ISituacionesEspecialesService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SituacionesEspecialesService.class);

    public SituacionesEspecialesService(ISituacionesEspecialesDAO dao) {
        super(dao);
    }
}
