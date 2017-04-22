package ar.com.iua.modulo.model.persistence.dao;

import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.User;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

public interface IUserDAO extends IGenericDAO<User, Integer> {
		
		
		public User load(String name) throws PersistenceException, NotFoundException;
}
