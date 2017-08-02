package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Localidad;
import ar.com.iua.modulo.model.persistence.dao.ILocalidadDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 01/08/17.
 */
public class LocalidadDAO extends GenericDAO<Localidad, Integer> implements ILocalidadDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(LocalidadDAO.class);

    public LocalidadDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
