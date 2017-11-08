package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.SituacionesEspeciales;
import ar.com.iua.modulo.model.persistence.dao.ISituacionesEspecialesDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 05/11/17.
 */
public class SituacionesEspecialesDAO  extends GenericDAO<SituacionesEspeciales, Integer> implements ISituacionesEspecialesDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SituacionesEspecialesDAO.class);
    public SituacionesEspecialesDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
