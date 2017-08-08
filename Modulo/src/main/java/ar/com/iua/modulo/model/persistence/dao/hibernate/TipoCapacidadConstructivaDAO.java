package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.TipoCapacidadConstructiva;
import ar.com.iua.modulo.model.persistence.dao.ITipoCapacidadConstructivaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 07/08/17.
 */
public class TipoCapacidadConstructivaDAO extends GenericDAO<TipoCapacidadConstructiva, Integer> implements ITipoCapacidadConstructivaDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TipoCapacidadConstructivaDAO.class);

    public TipoCapacidadConstructivaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
