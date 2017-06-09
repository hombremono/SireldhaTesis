package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.persistence.dao.IDireccionDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;

/**
 * Created by mnicolas on 04/06/17.
 */
public class DireccionDAO extends GenericDAO<Direccion, Integer> implements IDireccionDAO {

    private static final long serialVersionUID = 1206356050999505599L;

    public DireccionDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

}
