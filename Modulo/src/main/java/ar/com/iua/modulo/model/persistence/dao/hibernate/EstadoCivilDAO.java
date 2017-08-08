package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.Estado;
import ar.com.iua.modulo.model.EstadoCivil;
import ar.com.iua.modulo.model.persistence.dao.IEstadoCivilDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class EstadoCivilDAO extends GenericDAO<EstadoCivil, Integer> implements IEstadoCivilDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(EstadoCivil.class);

    public EstadoCivilDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
