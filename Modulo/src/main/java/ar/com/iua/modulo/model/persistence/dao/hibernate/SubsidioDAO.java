package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Subsidio;
import ar.com.iua.modulo.model.persistence.dao.ISubsidioDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 05/11/17.
 */
public class SubsidioDAO extends GenericDAO<Subsidio, Integer> implements ISubsidioDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Subsidio.class);

    public SubsidioDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
