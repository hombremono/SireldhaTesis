package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.SituacionInmueble;
import ar.com.iua.modulo.model.persistence.dao.ISituacionInmuebleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 01/08/17.
 */
public class SituacionInmuebleDAO extends GenericDAO<SituacionInmueble, Integer> implements ISituacionInmuebleDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SituacionInmueble.class);

    public SituacionInmuebleDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
