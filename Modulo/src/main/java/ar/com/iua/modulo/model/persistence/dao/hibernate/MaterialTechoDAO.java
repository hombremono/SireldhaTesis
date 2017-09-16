package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.MaterialTecho;
import ar.com.iua.modulo.model.persistence.dao.IMaterialTechoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class MaterialTechoDAO extends GenericDAO<MaterialTecho,Integer> implements IMaterialTechoDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(MaterialTechoDAO.class);

    public MaterialTechoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
