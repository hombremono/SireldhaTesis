package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.ServicioAgua;
import ar.com.iua.modulo.model.persistence.dao.IServicioAguaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 23/09/17.
 */
public class ServicioAguaDAO extends GenericDAO<ServicioAgua, Integer> implements IServicioAguaDAO {

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(ServicioAguaDAO.class);

    public ServicioAguaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
