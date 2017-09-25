package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.PoseeBano;
import ar.com.iua.modulo.model.persistence.dao.IPoseeBanoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 24/09/17.
 */
public class PoseeBanoDAO extends GenericDAO<PoseeBano, Integer> implements IPoseeBanoDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PoseeBanoDAO.class);

    public PoseeBanoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
