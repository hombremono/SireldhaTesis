package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.User;

public interface IUserService extends IGenericService<User, Integer> {
	public User load(String name) throws ServiceException, NotFoundException;
	
	

}
