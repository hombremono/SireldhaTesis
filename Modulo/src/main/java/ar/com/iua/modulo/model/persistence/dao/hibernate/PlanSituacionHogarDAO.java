package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Plan_SituacionHogar;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.IPlanSituacionHogarDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 15/01/18.
 */
public class PlanSituacionHogarDAO extends GenericDAO<Plan_SituacionHogar,Integer> implements IPlanSituacionHogarDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Plan_SituacionHogar.class);

    public PlanSituacionHogarDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
