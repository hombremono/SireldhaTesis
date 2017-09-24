package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Pared;
import ar.com.iua.modulo.model.persistence.dao.IParedDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 23/09/17.
 */
public class ParedDAO extends GenericDAO<Pared, Integer> implements IParedDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(ParedDAO.class);

    public ParedDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}