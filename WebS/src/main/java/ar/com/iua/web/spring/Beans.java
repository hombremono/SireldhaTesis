package ar.com.iua.web.spring;

import ar.com.iua.modulo.model.business.*;
import ar.com.iua.modulo.model.business.impl.*;
import ar.com.iua.modulo.model.persistence.dao.*;
import ar.com.iua.modulo.model.persistence.dao.hibernate.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Beans {

	//---------------------------------------------------DAO------------------------------------------------------------

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

	@Bean
	@Autowired
	public IDireccionDAO direccionDao(final SessionFactory sessionFactory) { return new DireccionDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITelefonoDAO telefonoDao(final SessionFactory sessionFactory){ return new TelefonoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPersonaDAO personaDao(final SessionFactory sessionFactory){ return new PersonaDAO(sessionFactory);}

	//---------------------------------------------------Services-------------------------------------------------------

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

	@Bean
	@Autowired
	public IDireccionService direccionService(final IDireccionDAO direccionDao) {return new DireccionService(direccionDao);}

	@Bean
	@Autowired
	public ITelefonoService telefonoService (final ITelefonoDAO telefonoDao) {return new TelefonoService(telefonoDao);}

	@Bean
	@Autowired
	public IPersonaService personaService (final  IPersonaDAO personaDao){return new PersonaService(personaDao);}
}
