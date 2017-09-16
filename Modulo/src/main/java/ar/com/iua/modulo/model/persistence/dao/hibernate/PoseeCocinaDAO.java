package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.PoseeCocina;
import ar.com.iua.modulo.model.persistence.dao.IPoseeCocinaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class PoseeCocinaDAO extends GenericDAO<PoseeCocina,Integer> implements IPoseeCocinaDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(PoseeCocinaDAO.class);

    public PoseeCocinaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
