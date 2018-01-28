package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.OrigenFinanciamiento;
import ar.com.iua.modulo.model.persistence.dao.IOrigenFinanciamientoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 28/01/18.
 */
public class OrigenFinanciamientoDAO extends GenericDAO<OrigenFinanciamiento, Integer> implements IOrigenFinanciamientoDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(OrigenFinanciamientoDAO.class);

    public OrigenFinanciamientoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
