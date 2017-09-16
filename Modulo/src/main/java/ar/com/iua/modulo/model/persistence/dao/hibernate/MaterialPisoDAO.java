package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.MaterialPared;
import ar.com.iua.modulo.model.MaterialPiso;
import ar.com.iua.modulo.model.persistence.dao.IMaterialPisoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class MaterialPisoDAO extends GenericDAO<MaterialPiso,Integer> implements IMaterialPisoDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(MaterialPisoDAO.class);

    public MaterialPisoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
