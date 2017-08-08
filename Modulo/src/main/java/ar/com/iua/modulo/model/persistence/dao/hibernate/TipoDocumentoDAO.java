package ar.com.iua.modulo.model.persistence.dao.hibernate;

import ar.com.iua.modulo.model.TipoDocumento;
import ar.com.iua.modulo.model.persistence.dao.ITipoDocumentoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 02/08/17.
 */
public class TipoDocumentoDAO extends GenericDAO<TipoDocumento, Integer> implements ITipoDocumentoDAO{
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(TipoDocumento.class);

    public TipoDocumentoDAO(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
