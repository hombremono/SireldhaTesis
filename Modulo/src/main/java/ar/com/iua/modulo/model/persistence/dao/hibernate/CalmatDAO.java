package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Calmat;
import ar.com.iua.modulo.model.persistence.dao.ICalmatDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 24/02/18.
 */
public class CalmatDAO extends GenericDAO<Calmat, Integer> implements ICalmatDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(CalmatDAO.class);

    public CalmatDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
