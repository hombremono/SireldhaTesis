package ar.com.iua.modulo.business.services.Interfaces;

import ar.com.iua.modulo.business.services.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.User;

public interface IUserService extends IGenericService<User, Integer> {
	public User load(String name) throws ServiceException, NotFoundException;
	
	

}
