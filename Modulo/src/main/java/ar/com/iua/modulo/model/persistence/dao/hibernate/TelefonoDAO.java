package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.model.persistence.dao.ITelefonoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;

/**
 * Created by mnicolas on 06/06/17.
 */
public class TelefonoDAO extends GenericDAO<Telefono, Integer> implements ITelefonoDAO {

    private static final long serialVersionUID = 1206356050999505599L;

    public TelefonoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
