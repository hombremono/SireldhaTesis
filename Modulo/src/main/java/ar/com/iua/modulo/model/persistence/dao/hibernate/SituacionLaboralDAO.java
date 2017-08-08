package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.SituacionLaboral;
import ar.com.iua.modulo.model.persistence.dao.ISituacionLaboralDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class SituacionLaboralDAO extends GenericDAO<SituacionLaboral, Integer> implements ISituacionLaboralDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(SituacionLaboral.class);

    public SituacionLaboralDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
