package ar.com.iua.modulo.model.persistence.dao.hibernate;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.User;
import ar.com.iua.modulo.model.persistence.dao.IUserDAO;
import ar.com.iua.modulo.persistence.dao.hibernate.GenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

public class UserDAO extends GenericDAO<User, Integer> implements IUserDAO {

	private static final long serialVersionUID = 1206356050999505599L;
	private static Logger LOG = LoggerFactory.getLogger(UserDAO.class);

	public UserDAO(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public User load(String name) throws PersistenceException, NotFoundException {
		User r = null;
		try {
			r = (User) getSession().createQuery("FROM User WHERE name=:username").setString("username", name)
					.uniqueResult();
			
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			throw new PersistenceException(e.getMessage(), e);
		} finally {
			closeSession();
		}
		if (r == null)
			throw new NotFoundException("user=" + name + " not found!");
		return r;
	}
}