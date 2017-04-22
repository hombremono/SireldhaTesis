package ar.com.iua.modulo.model.business;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.User;

public interface IUserService extends IGenericService<User, Integer> {
	public User load(String name) throws ServiceException, NotFoundException;
	
	

}
