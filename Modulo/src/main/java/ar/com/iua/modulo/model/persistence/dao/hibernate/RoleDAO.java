package ar.com.iua.modulo.model.persistence.dao.hibernate;

import org.hibernate.SessionFactory;

import ar.com.iua.modulo.model.Role;
import ar.com.iua.modulo.model.persistence.dao.IRoleDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;

public class RoleDAO extends GenericDAO<Role, Integer> implements IRoleDAO {

	private static final long serialVersionUID = 1206356050999505599L;

	public RoleDAO(SessionFactory sessionFactory) {
		super(sessionFactory);
	}


}