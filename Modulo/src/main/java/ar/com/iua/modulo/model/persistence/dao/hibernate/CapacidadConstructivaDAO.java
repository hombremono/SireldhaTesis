package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.CapacidadConstructiva;
import ar.com.iua.modulo.model.persistence.dao.ICapacidadConstructivaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class CapacidadConstructivaDAO extends GenericDAO<CapacidadConstructiva, Integer> implements ICapacidadConstructivaDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(CapacidadConstructiva.class);

    public CapacidadConstructivaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
