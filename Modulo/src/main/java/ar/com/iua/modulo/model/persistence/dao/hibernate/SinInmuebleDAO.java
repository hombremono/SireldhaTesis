package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.SinInmueble;
import ar.com.iua.modulo.model.persistence.dao.ISinInmuebleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/09/17.
 */
public class SinInmuebleDAO extends GenericDAO<SinInmueble,Integer> implements ISinInmuebleDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SinInmuebleDAO.class);

    public SinInmuebleDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
