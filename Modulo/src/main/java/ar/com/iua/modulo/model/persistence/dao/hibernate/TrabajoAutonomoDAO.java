package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.TrabajoAutonomo;
import ar.com.iua.modulo.model.persistence.dao.ITrabajoAutonomoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 18/09/17.
 */
public class TrabajoAutonomoDAO extends GenericDAO<TrabajoAutonomo, Integer> implements ITrabajoAutonomoDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TrabajoAutonomoDAO.class);

    public TrabajoAutonomoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}