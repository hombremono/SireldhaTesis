package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.RolFamiliar;
import ar.com.iua.modulo.model.persistence.dao.IRolFamiliarDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class RolFamiliarDAO extends GenericDAO<RolFamiliar, Integer> implements IRolFamiliarDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(RolFamiliarDAO.class);

    public RolFamiliarDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
