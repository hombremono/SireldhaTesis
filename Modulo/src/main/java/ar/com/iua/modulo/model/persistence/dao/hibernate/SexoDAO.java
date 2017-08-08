package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Sexo;
import ar.com.iua.modulo.model.persistence.dao.ISexoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class SexoDAO extends GenericDAO<Sexo, Integer> implements ISexoDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(Sexo.class);

    public SexoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
