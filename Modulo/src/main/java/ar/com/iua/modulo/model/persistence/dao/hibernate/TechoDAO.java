package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Techo;
import ar.com.iua.modulo.model.persistence.dao.ITechoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 23/09/17.
 */
public class TechoDAO extends GenericDAO<Techo, Integer> implements ITechoDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TechoDAO.class);

    public TechoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}