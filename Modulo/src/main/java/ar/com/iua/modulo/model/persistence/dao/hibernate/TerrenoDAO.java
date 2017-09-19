package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Terreno;
import ar.com.iua.modulo.model.persistence.dao.ITerrenoDao;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/09/17.
 */
public class TerrenoDAO extends GenericDAO<Terreno,Integer> implements ITerrenoDao{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TerrenoDAO.class);

    public TerrenoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
