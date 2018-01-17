package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.PoseeInmueble;
import ar.com.iua.modulo.model.persistence.dao.IPoseeInmuebleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by mnicolas on 15/01/18.
 */
public class PoseeInmuebleDAO extends GenericDAO<PoseeInmueble, Integer> implements IPoseeInmuebleDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PoseeInmueble.class);

    public PoseeInmuebleDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
