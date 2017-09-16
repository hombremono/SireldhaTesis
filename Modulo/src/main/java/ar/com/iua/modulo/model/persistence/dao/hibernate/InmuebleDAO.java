package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.persistence.dao.IInmuebleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class InmuebleDAO extends GenericDAO<Inmueble, Integer> implements IInmuebleDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(InmuebleDAO.class);

    public InmuebleDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
