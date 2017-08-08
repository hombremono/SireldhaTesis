package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Nacionalidad;
import ar.com.iua.modulo.model.persistence.dao.INacionalidadDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class NacionalidadDAO extends GenericDAO<Nacionalidad, Integer> implements INacionalidadDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Nacionalidad.class);

    public NacionalidadDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
