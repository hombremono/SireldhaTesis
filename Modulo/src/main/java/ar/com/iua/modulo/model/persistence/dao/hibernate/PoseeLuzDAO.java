package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.PoseeLuz;
import ar.com.iua.modulo.model.persistence.dao.IPoseeLuzDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class PoseeLuzDAO extends GenericDAO<PoseeLuz,Integer> implements IPoseeLuzDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PoseeLuzDAO.class);

    public PoseeLuzDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
