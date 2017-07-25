package ar.com.iua.web.spring.security.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.User;
import ar.com.iua.modulo.business.Interfaces.IUserService;
import ar.com.iua.web.spring.security.model.UserDetailsAdapter;

@Component
public class UserDetailService implements UserDetailsService {
	private static Logger LOG = LoggerFactory.getLogger(UserDetailService.class);
	@Autowired
	private IUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		User r=null;
		try {
			r = userService.load(userName);
		} catch (ServiceException e) {
			LOG.error(e.getMessage(),e);
		} catch (NotFoundException e) {
			throw new UsernameNotFoundException(e.getMessage());
		}
		UserDetailsAdapter u=new UserDetailsAdapter(r);
		LOG.debug("User logged: {} - {}", u.getName(), u.getAuthorities());
		return u;
	}

}
