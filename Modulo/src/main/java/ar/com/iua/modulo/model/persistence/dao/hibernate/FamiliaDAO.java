package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.persistence.dao.IFamiliaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 14/06/17.
 */
public class FamiliaDAO extends GenericDAO <Familia,Integer> implements IFamiliaDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(FamiliaDAO.class);

    public FamiliaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
