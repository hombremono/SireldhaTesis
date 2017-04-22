package ar.com.iua.modulo.model.persistence.dao.hibernate;

import org.hibernate.SessionFactory;

import ar.com.iua.modulo.model.Archivo;
import ar.com.iua.modulo.model.persistence.dao.IArchivoDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;

public class ArchivoDAO extends GenericDAO<Archivo, Integer> implements IArchivoDAO {


	public ArchivoDAO(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	private static final long serialVersionUID = 3458891734069602554L;

	

}