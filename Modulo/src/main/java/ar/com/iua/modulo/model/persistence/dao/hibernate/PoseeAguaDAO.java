package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.PoseeAgua;
import ar.com.iua.modulo.model.persistence.dao.IPoseeAguaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class PoseeAguaDAO extends GenericDAO<PoseeAgua,Integer> implements IPoseeAguaDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PoseeAguaDAO.class);

    public PoseeAguaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}