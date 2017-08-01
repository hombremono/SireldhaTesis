package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.SolucionHabitacional;
import ar.com.iua.modulo.model.persistence.dao.ISolucionHabitacionalDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 01/08/17.
 */
public class SolucionHabitacionalDAO extends GenericDAO<SolucionHabitacional, Integer> implements ISolucionHabitacionalDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SolucionHabitacionalDAO.class);

    public SolucionHabitacionalDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
