package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.TrabajoDependencia;
import ar.com.iua.modulo.model.persistence.dao.ITrabajoDependenciaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 18/09/17.
 */
public class TrabajoDependenciaDAO extends GenericDAO<TrabajoDependencia, Integer> implements ITrabajoDependenciaDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TrabajoDependenciaDAO.class);

    public TrabajoDependenciaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}