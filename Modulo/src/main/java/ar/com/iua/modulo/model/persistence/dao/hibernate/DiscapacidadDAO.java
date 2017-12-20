package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Discapacidad;
import ar.com.iua.modulo.model.persistence.dao.IDiscapacidadDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/12/17.
 */
public class DiscapacidadDAO extends GenericDAO<Discapacidad, Integer> implements IDiscapacidadDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Discapacidad.class);
    public DiscapacidadDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
