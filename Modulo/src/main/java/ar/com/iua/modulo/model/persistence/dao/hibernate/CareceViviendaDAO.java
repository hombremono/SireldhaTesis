package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.CareceVivienda;
import ar.com.iua.modulo.model.persistence.dao.ICareceViviendaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 19/09/17.
 */
public class CareceViviendaDAO extends GenericDAO<CareceVivienda,Integer> implements ICareceViviendaDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(CareceViviendaDAO.class);

    public CareceViviendaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
