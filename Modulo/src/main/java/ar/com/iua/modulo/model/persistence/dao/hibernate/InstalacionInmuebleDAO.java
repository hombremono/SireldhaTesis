package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.InstalacionInmueble;
import ar.com.iua.modulo.model.persistence.dao.IInstalacionInmuebleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 20/11/17.
 */
public class InstalacionInmuebleDAO extends GenericDAO <InstalacionInmueble, Integer> implements IInstalacionInmuebleDAO {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(InstalacionInmuebleDAO.class);

    public InstalacionInmuebleDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
