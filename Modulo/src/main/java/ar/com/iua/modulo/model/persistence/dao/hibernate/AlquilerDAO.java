package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Alquiler;
import ar.com.iua.modulo.model.persistence.dao.IAlquilerDao;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/09/17.
 */
public class AlquilerDAO extends GenericDAO<Alquiler,Integer> implements IAlquilerDao{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(AlquilerDAO.class);

    public AlquilerDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
