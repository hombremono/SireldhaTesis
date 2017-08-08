package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Profesion;
import ar.com.iua.modulo.model.persistence.dao.IProfesionDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class ProfesionDAO extends GenericDAO<Profesion, Integer> implements IProfesionDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Profesion.class);

    public ProfesionDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
