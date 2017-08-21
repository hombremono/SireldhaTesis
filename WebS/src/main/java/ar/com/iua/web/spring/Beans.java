package ar.com.iua.web.spring;

import ar.com.iua.modulo.business.Interfaces.*;
import ar.com.iua.modulo.business.impl.*;
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

	@Bean
	@Autowired
	public IFamiliaDAO familiaDao(final SessionFactory sessionFactory){ return new FamiliaDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISituacionInmuebleDAO situacionInmuebleDao(final SessionFactory sessionFactory){ return new SituacionInmuebleDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISolucionHabitacionalDAO solucionHabitacionalDao(final SessionFactory sessionFactory){ return new SolucionHabitacionalDAO(sessionFactory);}

	@Bean
	@Autowired
	public ILocalidadDAO localidadDao(final SessionFactory sessionFactory){ return new LocalidadDAO(sessionFactory);}

	@Bean
	@Autowired
	public IRolFamiliarDAO rolFamiliarDAO(final SessionFactory sessionFactory){ return new RolFamiliarDAO(sessionFactory);}

	@Bean
	@Autowired
	public IEstadoCivilDAO estadoCivilDAO(final SessionFactory sessionFactory){ return new EstadoCivilDAO(sessionFactory);}

	@Bean
	@Autowired
	public IEstudioDAO estudioDAO(final SessionFactory sessionFactory){ return new EstudiosDAO(sessionFactory);}

	@Bean
	@Autowired
	public INacionalidadDAO nacionalidadDAO(final SessionFactory sessionFactory){ return new NacionalidadDAO(sessionFactory);}

	@Bean
	@Autowired
	public IProfesionDAO profesionDAO(final SessionFactory sessionFactory){ return new ProfesionDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISexoDAO sexoDAO(final SessionFactory sessionFactory){ return new SexoDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISituacionLaboralDAO situacionLaboralDAO(final SessionFactory sessionFactory){ return new SituacionLaboralDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITipoDocumentoDAO tipoDocumentoDAO(final SessionFactory sessionFactory){ return new TipoDocumentoDAO(sessionFactory);}

	@Bean
	@Autowired
	public ICapacidadConstructivaDAO capacidadConstructivaDAO(final SessionFactory sessionFactory){ return new CapacidadConstructivaDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITipoCapacidadConstructivaDAO tipoCapacidadConstructivaDAO(final SessionFactory sessionFactory){ return new TipoCapacidadConstructivaDAO(sessionFactory);}


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
	public IPersonaService personaService (final  IPersonaDAO personaDao,final ITipoCapacidadConstructivaDAO tipoCapacidadConstructivaDAO,
										   final IEstadoCivilDAO estadoCivilDAO, final IEstudioDAO estudioDAO,
										   final INacionalidadDAO nacionalidadDAO,final IProfesionDAO profesionDAO,
										   final ISexoDAO sexoDAO, final ISituacionLaboralDAO situacionLaboralDAO,
										   final ITipoDocumentoDAO tipoDocumentoDAO, final ILocalidadDAO localidadDAO,
										   final IRolFamiliarDAO rolFamiliarDAO){
		return new PersonaService(personaDao,tipoCapacidadConstructivaDAO,estadoCivilDAO,estudioDAO,nacionalidadDAO,
				profesionDAO, sexoDAO, situacionLaboralDAO, tipoDocumentoDAO, localidadDAO,rolFamiliarDAO); }

	@Bean
	@Autowired
	public IFamiliaService familiaService (final IFamiliaDAO familiaDao, final IPersonaDAO personaDao){ return new FamiliaService(familiaDao,personaDao); }

	@Bean
	@Autowired
	public IHogarService hogarService (final ISolucionHabitacionalDAO daoSH,final ISituacionInmuebleDAO daoSI,final ILocalidadDAO daoL)
	{ return new HogarService(daoSH,daoSI,daoL); }
}
