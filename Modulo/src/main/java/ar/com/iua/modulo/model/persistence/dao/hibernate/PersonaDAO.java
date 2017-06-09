package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.persistence.dao.IPersonaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 14/05/17.
 */
public class PersonaDAO extends GenericDAO <Persona, Integer> implements IPersonaDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(UserDAO.class);

    public PersonaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
