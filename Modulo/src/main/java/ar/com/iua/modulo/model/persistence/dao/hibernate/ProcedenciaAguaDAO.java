package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.ProcedenciaAgua;
import ar.com.iua.modulo.model.persistence.dao.IProcedenciaAguaDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class ProcedenciaAguaDAO extends GenericDAO<ProcedenciaAgua,Integer> implements IProcedenciaAguaDAO{

    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(ProcedenciaAguaDAO.class);

    public ProcedenciaAguaDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
