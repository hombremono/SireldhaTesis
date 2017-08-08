package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Estudios;
import ar.com.iua.modulo.model.persistence.dao.IEstudioDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class EstudiosDAO extends GenericDAO<Estudios, Integer> implements IEstudioDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Estudios.class);

    public EstudiosDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
