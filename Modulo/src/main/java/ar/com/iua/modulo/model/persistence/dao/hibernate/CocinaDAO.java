package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Cocina;
import ar.com.iua.modulo.model.persistence.dao.ICocinaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 24/09/17.
 */
public class CocinaDAO extends GenericDAO<Cocina, Integer> implements ICocinaDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(CocinaDAO.class);

    public CocinaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
