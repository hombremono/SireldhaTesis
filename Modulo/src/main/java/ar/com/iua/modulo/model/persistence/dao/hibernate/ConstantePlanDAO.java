package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.ConstantePlan;
import ar.com.iua.modulo.model.persistence.dao.IConstantePlanDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 04/02/18.
 */
public class ConstantePlanDAO extends GenericDAO<ConstantePlan,Integer> implements IConstantePlanDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(ConstantePlanDAO.class);

    public ConstantePlanDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}

