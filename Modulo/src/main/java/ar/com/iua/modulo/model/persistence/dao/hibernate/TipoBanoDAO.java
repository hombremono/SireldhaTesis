package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.TipoBano;
import ar.com.iua.modulo.model.persistence.dao.ITipoBanoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class TipoBanoDAO extends GenericDAO<TipoBano,Integer> implements ITipoBanoDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TipoBanoDAO.class);

    public TipoBanoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
