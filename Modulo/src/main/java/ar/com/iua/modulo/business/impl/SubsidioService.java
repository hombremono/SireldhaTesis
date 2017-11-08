package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.Interfaces.ISubsidioService;
import ar.com.iua.modulo.model.Subsidio;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 07/11/17.
 */
public class SubsidioService extends GenericService<Subsidio,Integer> implements ISubsidioService {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SubsidioService.class);

    public SubsidioService(IGenericDAO dao) {
        super(dao);
    }
}
