package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Plan_SituacionRegistro;
import ar.com.iua.modulo.model.persistence.dao.IPlanSituacionRegistroDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 15/01/18.
 */
public class PlanSituacionRegistroDAO extends GenericDAO<Plan_SituacionRegistro, Integer> implements IPlanSituacionRegistroDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Plan_SituacionRegistro.class);

    public PlanSituacionRegistroDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
