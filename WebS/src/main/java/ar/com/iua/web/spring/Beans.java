package ar.com.iua.web.spring;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ar.com.iua.modulo.model.business.IArchivoService;
import ar.com.iua.modulo.model.business.IRoleService;
import ar.com.iua.modulo.model.business.IUserService;
import ar.com.iua.modulo.model.business.impl.ArchivoService;
import ar.com.iua.modulo.model.business.impl.RoleService;
import ar.com.iua.modulo.model.business.impl.UserService;
import ar.com.iua.modulo.model.persistence.dao.IArchivoDAO;
import ar.com.iua.modulo.model.persistence.dao.IRoleDAO;
import ar.com.iua.modulo.model.persistence.dao.IUserDAO;
import ar.com.iua.modulo.model.persistence.dao.hibernate.ArchivoDAO;
import ar.com.iua.modulo.model.persistence.dao.hibernate.RoleDAO;
import ar.com.iua.modulo.model.persistence.dao.hibernate.UserDAO;

@Configuration
public class Beans {

	// DAO
	@Bean
	@Autowired
	public IUserDAO userDao(final SessionFactory sessionFactory) {
		return new UserDAO(sessionFactory);
	}
	@Bean
	@Autowired
	public IRoleDAO roleDao(final SessionFactory sessionFactory) {
		return new RoleDAO(sessionFactory);
	}

	@Bean
	@Autowired
	public IArchivoDAO archivoDao(final SessionFactory sessionFactory) {
		return new ArchivoDAO(sessionFactory);
	}

	// Services
	@Bean
	@Autowired
	public IUserService userService(final IUserDAO userDao) {
		return new UserService(userDao);
	}
	@Bean
	@Autowired
	public IRoleService roleService(final IRoleDAO roleDao) {
		return new RoleService(roleDao);
	}

	@Bean
	@Autowired
	public IArchivoService archivoService(final IArchivoDAO archivoDao) {
		return new ArchivoService(archivoDao);
	}
	
}
