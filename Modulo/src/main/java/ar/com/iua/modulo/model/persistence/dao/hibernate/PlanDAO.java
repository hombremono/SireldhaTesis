package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Plan;
import ar.com.iua.modulo.model.persistence.dao.IPlanDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 28/01/18.
 */
public class PlanDAO extends GenericDAO<Plan, Integer> implements IPlanDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PlanDAO.class);

    public PlanDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

}
