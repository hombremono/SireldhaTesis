package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Plan_CaracteristicasHogar;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.IPlanCaracteristicasHogarDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.apache.commons.dbutils.ResultSetHandler;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 15/01/18.
 */
public class PlanCaracteristicasHogarDAO extends GenericDAO<Plan_CaracteristicasHogar, Integer> implements IPlanCaracteristicasHogarDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Plan_CaracteristicasHogar.class);

    public PlanCaracteristicasHogarDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
