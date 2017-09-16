package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.MotivoCarecimiento;
import ar.com.iua.modulo.model.persistence.dao.IMotivoCarecimientoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class MotivoCarecimientoDAO extends GenericDAO<MotivoCarecimiento,Integer> implements IMotivoCarecimientoDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(MotivoCarecimientoDAO.class);

    public MotivoCarecimientoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
