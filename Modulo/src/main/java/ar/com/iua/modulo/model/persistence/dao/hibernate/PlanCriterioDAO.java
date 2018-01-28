package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.persistence.dao.IPlanCriterioDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 28/01/18.
 */
public class PlanCriterioDAO extends GenericDAO<Plan_Criterio, Integer> implements IPlanCriterioDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PlanCriterioDAO.class);

    public PlanCriterioDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
