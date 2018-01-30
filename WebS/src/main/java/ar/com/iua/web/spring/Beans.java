package ar.com.iua.web.spring;

import ar.com.iua.modulo.business.services.Interfaces.*;
import ar.com.iua.modulo.business.services.impl.*;
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

	@Bean
	@Autowired
	public IMaterialParedDAO materialParedDAO (final SessionFactory sessionFactory) { return new MaterialParedDAO(sessionFactory);}

	@Bean
	@Autowired
	public IMaterialPisoDAO materialPisoDAO (final SessionFactory sessionFactory) { return new MaterialPisoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IMaterialTechoDAO materialTechoDAO (final SessionFactory sessionFactory) { return new MaterialTechoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IMotivoCarecimientoDAO motivoCarecimientoDAO (final SessionFactory sessionFactory) { return new MotivoCarecimientoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPoseeAguaDAO poseeAguaDAO (final SessionFactory sessionFactory) { return new PoseeAguaDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPoseeCocinaDAO poseeCocinaDAO (final SessionFactory sessionFactory) { return new PoseeCocinaDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPoseeLuzDAO poseeLuzDAO (final SessionFactory sessionFactory) { return new PoseeLuzDAO(sessionFactory);}

	@Bean
	@Autowired
	public IProcedenciaAguaDAO procedenciaAguaDAO (final SessionFactory sessionFactory) { return new ProcedenciaAguaDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITipoBanoDAO tipoBanoDAO (final SessionFactory sessionFactory) { return new TipoBanoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IInmuebleDAO inmuebleDAO (final SessionFactory sessionFactory) { return new InmuebleDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITrabajoAutonomoDAO trabajoAutonomoDAO (final SessionFactory sessionFactory) { return new TrabajoAutonomoDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITrabajoDependenciaDAO trabajoDependenciaDAO (final SessionFactory sessionFactory) { return new TrabajoDependenciaDAO(sessionFactory);}

	@Bean
	@Autowired
	public IAlquilerDao alquilerDao (final SessionFactory sessionFactory) { return new AlquilerDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITerrenoDao terrenoDao (final SessionFactory sessionFactory) { return new TerrenoDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISinInmuebleDAO sinInmuebleDAO (final SessionFactory sessionFactory) { return new SinInmuebleDAO(sessionFactory);}

	@Bean
	@Autowired
	public ICareceViviendaDAO careceViviendaDAO (final SessionFactory sessionFactory) { return new CareceViviendaDAO(sessionFactory);}

	@Bean
	@Autowired
	public IParedDAO paredDAO (final SessionFactory sessionFactory) { return new ParedDAO(sessionFactory);}

	@Bean
	@Autowired
	public ITechoDAO techoDAO (final SessionFactory sessionFactory) { return new TechoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IServicioAguaDAO servicioAguaDAO (final SessionFactory sessionFactory)
	{ return new ServicioAguaDAO(sessionFactory);}

	@Bean
	@Autowired
	public ICocinaDAO cocinaDAO (final SessionFactory sessionFactory) { return new CocinaDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPoseeBanoDAO poseeBanoDAO (final SessionFactory sessionFactory) { return new PoseeBanoDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISubsidioDAO subsidioDAO (final SessionFactory sessionFactory) { return new SubsidioDAO(sessionFactory);}

	@Bean
	@Autowired
	public ISituacionesEspecialesDAO situacionesEspecialesDAO (final SessionFactory sessionFactory)
	{ return new SituacionesEspecialesDAO(sessionFactory);}

	@Bean
	@Autowired
	public IDiscapacidadDAO discapacidadDAO (final SessionFactory sessionFactory)
	{ return new DiscapacidadDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanSituacionHabitacionalDAO planSituacionHabitacionalDAO (final SessionFactory sessionFactory)
	{ return new PlanSituacionHabitacionalDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanCalmatDAO planCalmatDAO (final SessionFactory sessionFactory)
	{ return new PlanCalmatDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanCaracteristicasHogarDAO planCaracteristicasHogarDAO (final SessionFactory sessionFactory)
	{ return new PlanCaracteristicasHogarDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanRangoEdadDAO planRangoEdadDAO (final SessionFactory sessionFactory)
	{ return new PlanRangoEdadDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanSituacionHogarDAO situacionHogarDAO(final SessionFactory sessionFactory)
	{ return new PlanSituacionHogarDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanSituacionRegistroDAO situacionRegistroDAO (final SessionFactory sessionFactory)
	{ return new PlanSituacionRegistroDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPoseeInmuebleDAO poseeInmuebleDAO (final SessionFactory sessionFactory)
	{ return new PoseeInmuebleDAO(sessionFactory);}

	@Bean
	@Autowired
	public IInstalacionInmuebleDAO instalacionInmuebleDAO (final SessionFactory sessionFactory)
	{ return new InstalacionInmuebleDAO(sessionFactory);}

	@Bean
	@Autowired
	public IOrigenFinanciamientoDAO origenFinanciamientoDAO (final SessionFactory sessionFactory)
	{ return new OrigenFinanciamientoDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanDAO planDAO (final SessionFactory sessionFactory)
	{ return new PlanDAO(sessionFactory);}

	@Bean
	@Autowired
	public IPlanCriterioDAO planCriterioDAO (final SessionFactory sessionFactory)
	{ return new PlanCriterioDAO(sessionFactory);}





	//---------------------------------------------------Services-------------------------------------------------------

	@Bean
	@Autowired
	public ISubsidioService subsidioService(final ISubsidioDAO subsidioDAO) { return new SubsidioService(subsidioDAO);}

	@Bean
	@Autowired
	public ISituacionesEspecialesService situacionesEspecialesService(final ISituacionesEspecialesDAO situacionesEspecialesDAO)
	{ return new SituacionesEspecialesService(situacionesEspecialesDAO);}

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
	public IPersonaService personaService (final  IPersonaDAO personaDao,
										   final ITipoCapacidadConstructivaDAO tipoCapacidadConstructivaDAO,
										   final IEstadoCivilDAO estadoCivilDAO,
										   final IEstudioDAO estudioDAO,
										   final INacionalidadDAO nacionalidadDAO,
										   final IProfesionDAO profesionDAO,
										   final ISexoDAO sexoDAO,
										   final ISituacionLaboralDAO situacionLaboralDAO,
										   final ITipoDocumentoDAO tipoDocumentoDAO,
										   final ILocalidadDAO localidadDAO,
										   final IRolFamiliarDAO rolFamiliarDAO,
										   final ISubsidioDAO subsidioDAO,
										   final ISituacionesEspecialesDAO situacionesEspecialesDAO,
										   final IDiscapacidadDAO discapacidadDAO){
		return new PersonaService(
				personaDao,
				tipoCapacidadConstructivaDAO,
				estadoCivilDAO,
				estudioDAO,
				nacionalidadDAO,
				profesionDAO,
				sexoDAO,
				situacionLaboralDAO,
				tipoDocumentoDAO,
				localidadDAO,
				rolFamiliarDAO,
				subsidioDAO,
				situacionesEspecialesDAO,
				discapacidadDAO); }

	@Bean
	@Autowired
	public IFamiliaService familiaService (final IFamiliaDAO familiaDao,
										   final IPersonaDAO personaDao){
		return new FamiliaService(
				familiaDao,
				personaDao); }

	@Bean
	@Autowired
	public IHogarService hogarService (final ISolucionHabitacionalDAO daoSH,
									   final ISituacionInmuebleDAO daoSI,
									   final ILocalidadDAO daoL)
	{ return new HogarService(
			daoSH,
			daoSI,
			daoL); }

	@Bean
	@Autowired
	public IInmuebleService inmuebleService (final IInmuebleDAO dao,
											 final IMotivoCarecimientoDAO motivoCarecimientoDAO,
											 final IMaterialParedDAO materialParedDAO,
											 final IMaterialTechoDAO materialTechoDAO,
											 final IMaterialPisoDAO materialPisoDAO,
											 final IPoseeAguaDAO poseeAguaDAO,
											 final IProcedenciaAguaDAO procedenciaAguaDAO,
											 final ITipoBanoDAO tipoBanoDAO,
											 final IPoseeLuzDAO poseeLuzDAO,
											 final IPoseeCocinaDAO poseeCocinaDAO,
											 final ILocalidadDAO localidadDAO,
											 final IParedDAO paredDAO,
											 final ITechoDAO techoDAO,
											 final IServicioAguaDAO servicioAguaDAO,
											 final ICocinaDAO cocinaDAO,
											 final IPoseeBanoDAO poseeBanoDAO)
	{return new InmuebleService(
			dao,
			motivoCarecimientoDAO,
			materialParedDAO,
			materialTechoDAO,
			materialPisoDAO,
			poseeAguaDAO,
			procedenciaAguaDAO,
			tipoBanoDAO,
			poseeLuzDAO,
			poseeCocinaDAO,
			localidadDAO,
			paredDAO,
			techoDAO,
			servicioAguaDAO,
			cocinaDAO,
			poseeBanoDAO);}

	@Bean
	@Autowired
	public ITrabajoAutonomoService trabajoAutonomoService (final ITrabajoAutonomoDAO trabajoAutonomoDAO) {return new TrabajoAutonomoService(trabajoAutonomoDAO);}

	@Bean
	@Autowired
	public ITrabajoDependenciaService trabajoDependenciaService (final ITrabajoDependenciaDAO trabajoDependenciaDAO) {return new TrabajoDependenciaService(trabajoDependenciaDAO);}

	@Bean
	@Autowired
	public ISinInmuebleService sinInmuebleService (final ISinInmuebleDAO sinInmuebleDAO) {return new SinInmuebleService(sinInmuebleDAO);}

	@Bean
	@Autowired
	public ITerrenoService terrenoService (final ITerrenoDao terrenoDao) {return new TerrenoService(terrenoDao) ;}

	@Bean
	@Autowired
	public IAlquilerService alquilerService (final IAlquilerDao alquilerDao) {return new AlquilerService(alquilerDao);}

	@Bean
	@Autowired
	public ICareceViviendaService careceViviendaService (final ICareceViviendaDAO careceViviendaDAO) {return new CareceViviendaService(careceViviendaDAO);}

	@Bean
	@Autowired
	public ICapacidadConstructivaService capacidadConstructivaService (final ICapacidadConstructivaDAO capacidadConstructivaDAO) {return new CapacidadConstructivaService(capacidadConstructivaDAO);}

	@Bean
	@Autowired
	public IPlanService planService (final IPlanDAO planDAO,
									 final IPlanSituacionRegistroDAO planSituacionRegistroDAO,
									 final IPlanSituacionHogarDAO planSituacionHogarDAO,
									 final ILocalidadDAO localidadDAO,
									 final IPlanRangoEdadDAO planRangoEdadDAO,
									 final ISexoDAO sexoDAO,
									 final INacionalidadDAO nacionalidadDAO,
									 final IEstadoCivilDAO estadoCivilDAO,
									 final ISituacionLaboralDAO situacionLaboralDAO,
									 final ITipoCapacidadConstructivaDAO capacidadConstructivaDAO,
									 final IPlanCaracteristicasHogarDAO caracteristicasHogarDAO,
									 final IPoseeInmuebleDAO poseeInmuebleDAO,
									 final ISituacionInmuebleDAO situacionInmuebleDAO,
									 final IPlanCalmatDAO planCalmatDAO,
									 final IInstalacionInmuebleDAO instalacionInmuebleDAO,
									 final IPlanSituacionHabitacionalDAO planSituacionHabitacionalDAO,
									 final IOrigenFinanciamientoDAO origenFinanciamientoDAO,
									 final IPlanCriterioDAO planCriterioDAO) {
		return new PlanService(planDAO, planSituacionRegistroDAO,planSituacionHogarDAO,localidadDAO,planRangoEdadDAO,sexoDAO,
				nacionalidadDAO,estadoCivilDAO,situacionLaboralDAO,capacidadConstructivaDAO,caracteristicasHogarDAO,
				poseeInmuebleDAO,situacionInmuebleDAO,planCalmatDAO,instalacionInmuebleDAO,planSituacionHabitacionalDAO,
				origenFinanciamientoDAO, planCriterioDAO) ;}


}
