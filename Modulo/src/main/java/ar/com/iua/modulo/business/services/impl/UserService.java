package ar.com.iua.modulo.business.services.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.User;
import ar.com.iua.modulo.business.services.Interfaces.IUserService;
import ar.com.iua.modulo.model.persistence.dao.IUserDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

public class UserService extends GenericService<User, Integer> implements IUserService {

	private static final long serialVersionUID = -6357567873322505552L;
	private static Logger LOG = LoggerFactory.getLogger(UserService.class);
	private IUserDAO dao;
	public UserService(IUserDAO dao) {
		super(dao);
		this.dao=dao;
	}

	
	
	@Override
	public User load(String name) throws ServiceException, NotFoundException {
		try {
			return dao.load(name);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

}
