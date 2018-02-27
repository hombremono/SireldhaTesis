package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.*;
import ar.com.iua.modulo.model.persistence.dao.IPlanCriterioDAO;

import java.util.Date;
import java.util.List;

/**
 * Created by mnicolas on 26/02/18.
 */
public class ExcelExportModel {

    //------------------------UTILES---------------------
    private Familia familia;

    private List<Persona> integrantes;

    private Persona jefe;

    private IPlanService planService;
    //---------------------------------------------------

    private String nombreJefe;

    private String dniJefe;

    private int antiguedadInscripcion;

    private boolean documentacionCompleta;

    private String localidadResidencia;

    private Date inicioResidencia;

    private int edadJefe;

    private String generoJefe;

    private String nacionalidadJefe;

    private int cantidadIntegrantes;

    private String estadoCivilJefe;

    private String capacidadesConstructivas;

    private String situacionLaboralJefe;

    private float ingresoNetoFamiliar = 0;

    private boolean percepcionSubsidio;

    private boolean hogarUnipersonal;

    private boolean presenciaJubilado;

    private boolean presenciaDiscapacitado;

    private boolean presenciaMenor;

    private boolean presenciaMayor65;

    private boolean precenciaEnfermedadCronica;

    private boolean presenciaViolencia;

    private boolean presenciaMiembroGremio;

    private boolean presenciaAsociacionEntidadpublica;

    private boolean posecionInmueble;

    private String estadoInmueble;

    private String tipoVivienda;

    private boolean perdidaCatastrofe;

    private boolean zonaRiesgo;

    private String indiceCalmat;

    private boolean existeHacinamiento;

    private boolean existePromiscuidad;

    //------------------------------------------------------------------CONSTRUCTOR

    public ExcelExportModel(Familia familia, List<Persona> integrantes, IPlanService planService) {
        this.familia = familia;
        this.integrantes = integrantes;
        this.jefe = UtilsSingleton.getInstance().getJefeFamilia(integrantes);
        this.planService = planService;
        this.setData();
    }

    private void setData() {
        setNombreJefe();
        setDniJefe();
        setAntiguedadInscripcion();
        setDocumentacionCompleta();
        setLocalidadResidencia();
        setInicioResidencia();
        setEdadJefe();
        setGeneroJefe();
        setNacionalidadJefe();
        setCantidadIntegrantes();
        setEstadoCivilJefe();
        setCapacidadesConstructivas();
        setSituacionLaboralJefe();
        setPercepcionSubsidio();
        setHogarUnipersonal();
        setPosecionInmueble();
        setEstadoInmueble();
        setTipoVivienda();
        setPerdidaCatastrofe();
        setZonaRiesgo();
        setIndiceCalmat();
        setExisteHacinamiento();
        setExistePromiscuidad();
    }

    private void setDataPorIntegrante(){
        for(Persona integrante : this.integrantes) {
            setIngresoNetoFamiliar(integrante);
            setPresenciaJubilado(integrante);
            setPresenciaDiscapacitado(integrante);
            setPresenciaMenor(integrante);
            setPresenciaMayor65(integrante);
            setPrecenciaEnfermedadCronica(integrante);
            setPresenciaViolencia(integrante);
            setPresenciaMiembroGremio(integrante);
            setPresenciaAsociacionEntidadpublica(integrante);
        }
    }

    //------------------------------------------------------------------GET


    public String getNombreJefe() {
        return nombreJefe;
    }

    public String getDniJefe() {
        return dniJefe;
    }

    public int getAntiguedadInscripcion() {
        return antiguedadInscripcion;
    }

    public boolean isDocumentacionCompleta() {
        return documentacionCompleta;
    }

    public String getLocalidadResidencia() {
        return localidadResidencia;
    }

    public Date getInicioResidencia() {
        return inicioResidencia;
    }

    public int getEdadJefe() {
        return edadJefe;
    }

    public String getGeneroJefe() {
        return generoJefe;
    }

    public String getNacionalidadJefe() {
        return nacionalidadJefe;
    }

    public int getCantidadIntegrantes() {
        return cantidadIntegrantes;
    }

    public String getEstadoCivilJefe() {
        return estadoCivilJefe;
    }

    public String getCapacidadesConstructivas() {
        return capacidadesConstructivas;
    }

    public String getSituacionLaboralJefe() {
        return situacionLaboralJefe;
    }

    public float getIngresoNetoFamiliar() {
        return ingresoNetoFamiliar;
    }

    public boolean isPercepcionSubsidio() {
        return percepcionSubsidio;
    }

    public boolean isHogarUnipersonal() {
        return hogarUnipersonal;
    }

    public boolean isPresenciaJubilado() {
        return presenciaJubilado;
    }

    public boolean isPresenciaDiscapacitado() {
        return presenciaDiscapacitado;
    }

    public boolean isPresenciaMenor() {
        return presenciaMenor;
    }

    public boolean isPresenciaMayor65() {
        return presenciaMayor65;
    }

    public boolean isPrecenciaEnfermedadCronica() {
        return precenciaEnfermedadCronica;
    }

    public boolean isPresenciaViolencia() {
        return presenciaViolencia;
    }

    public boolean isPresenciaMiembroGremio() {
        return presenciaMiembroGremio;
    }

    public boolean isPresenciaAsociacionEntidadpublica() {
        return presenciaAsociacionEntidadpublica;
    }

    public boolean isPosecionInmueble() {
        return posecionInmueble;
    }

    public String getEstadoInmueble() {
        return estadoInmueble;
    }

    public String getTipoVivienda() {
        return tipoVivienda;
    }

    public boolean isPerdidaCatastrofe() {
        return perdidaCatastrofe;
    }

    public boolean isZonaRiesgo() {
        return zonaRiesgo;
    }

    public String getIndiceCalmat() {
        return indiceCalmat;
    }

    public boolean isExisteHacinamiento() {
        return existeHacinamiento;
    }

    public boolean isExistePromiscuidad() {
        return existePromiscuidad;
    }

    //------------------------------------------------------------------SET


    public void setNombreJefe() {
        this.nombreJefe = jefe.getApellido() + " " + jefe.getNombre();;
    }

    private void setDniJefe() {
        this.dniJefe = this.jefe.getNroDocumento();
    }

    private void setAntiguedadInscripcion() {
        this.antiguedadInscripcion = this.familia.getAntiguedadResidencia();
    }

    private void setDocumentacionCompleta() {
        this.documentacionCompleta = this.familia.isDocumentacionCompleta();
    }

    private void setLocalidadResidencia() {
        this.localidadResidencia = this.jefe.getLocalidad().getLocalidad();
    }

    private void setInicioResidencia() {
        this.inicioResidencia = familia.getFechaAlta();
    }

    private void setEdadJefe() {
        this.edadJefe = UtilsSingleton.getInstance().getEdad(this.jefe);
    }

    private void setGeneroJefe() {
        this.generoJefe = jefe.getSexo().getSexo();
    }

    private void setNacionalidadJefe() {
        this.nacionalidadJefe = jefe.getNacionalidad().getDescripcion();
    }

    private void setCantidadIntegrantes() {
        this.cantidadIntegrantes = this.integrantes.size();
    }

    private void setEstadoCivilJefe() {
        this.estadoCivilJefe = jefe.getEstadoCivil().getEstadoCivil();
    }

    private void setCapacidadesConstructivas() {
        this.capacidadesConstructivas = "";
        for(CapacidadConstructiva capacidad : this.jefe.getCapacidadesConstructivas()) {
            this.capacidadesConstructivas += capacidad.getTipoCapacidadConstructiva().getDescripcion() + ", ";
        }
    }

    private void setSituacionLaboralJefe() {
        this.situacionLaboralJefe = jefe.getSituacionLaboral().getDependenciaLaboral();
    }

    private void setIngresoNetoFamiliar(Persona integrante) {
        ingresoNetoFamiliar += integrante.getIngresoNeto();
    }

    private void setPercepcionSubsidio() {
        this.percepcionSubsidio = jefe.getSubsidio() != null;
    }

    private void setHogarUnipersonal() {
        this.hogarUnipersonal = this.integrantes.size() == 1;
    }

    private void setPresenciaJubilado(Persona integrante) {
        this.presenciaJubilado = (integrante.getNroCarnetJubilacion() != null);
    }

    private void setPresenciaDiscapacitado(Persona integrante) {
        this.presenciaDiscapacitado = (integrante.getDiscapacidad() != null &&
                integrante.getDiscapacidad().getId_Discapacidad() > 1);
    }

    private void setPresenciaMenor(Persona integrante) {
        this.presenciaMenor = (UtilsSingleton.getInstance().getEdad(integrante) < 18);
    }

    private void setPresenciaMayor65(Persona integrante) {
        this.presenciaMayor65 = (UtilsSingleton.getInstance().getEdad(integrante) > 65);
    }

    private void setPrecenciaEnfermedadCronica(Persona integrante) {
        this.precenciaEnfermedadCronica = integrante.getEnfermedadCronica();
    }

    private void setPresenciaViolencia(Persona integrante) {
        this.presenciaViolencia = (integrante.getSituacionesEspeciales() != null
                && integrante.getSituacionesEspeciales().isVictimaViolencia());
    }

    private void setPresenciaMiembroGremio(Persona integrante) {
        this.presenciaMiembroGremio = (integrante.getSituacionesEspeciales() != null
                && integrante.getSituacionesEspeciales().isAsociacionGremio());
    }

    private void setPresenciaAsociacionEntidadpublica(Persona integrante) {
        this.presenciaAsociacionEntidadpublica =  (integrante.getSituacionesEspeciales() != null
                && integrante.getSituacionesEspeciales().isAsociacionEntidadPublica());
    }

    private void setPosecionInmueble() {
        this.posecionInmueble = false;
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            this.posecionInmueble = inmueble != null;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private void setEstadoInmueble() {
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            int estadoAgua = 0;
            int estadoGas = 0;
            int estadoCloacal = 0;
            int estadoElectrica = 0;
            int estadoGeneral = 0;
            if (inmueble != null) {
                if (inmueble.getInstalacionAgua() != null){
                    estadoAgua = inmueble.getInstalacionAgua().getSeveridad();
                }
                if (inmueble.getInstalacionGas() != null){
                    estadoGas = inmueble.getInstalacionGas().getSeveridad();
                }
                if (inmueble.getInstalacionCloacal() != null){
                    estadoCloacal = inmueble.getInstalacionCloacal().getSeveridad();
                }
                if (inmueble.getInstalacionElectrica() != null){
                    estadoElectrica = inmueble.getInstalacionElectrica().getSeveridad();
                }
                estadoGeneral = Math.round((estadoAgua + estadoCloacal + estadoElectrica + estadoGas) / 4);

                    this.estadoInmueble = planService.getInstalacionBySeveridad(estadoGeneral).getDescripcion();
            }
        }catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private void setTipoVivienda() {
        this.tipoVivienda = this.familia.getSituacionInmueble().getDescripcion();
    }

    private void setPerdidaCatastrofe() {
        this.perdidaCatastrofe = false;
        try {
            this.perdidaCatastrofe = planService.getCarecimiento(familia.getId_Familia()) != null;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private void setZonaRiesgo() {
        this.zonaRiesgo = false;
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            if (inmueble != null) {
                this.zonaRiesgo = inmueble.isZonaInsalubre();
            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    private void setIndiceCalmat() {
        Inmueble inmueble = null;
        try {
            inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            if (inmueble != null) {
                this.indiceCalmat = planService.calcularCalmat(inmueble).getConstanteCalmat().getConstante();
            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }

    }

    private void setExisteHacinamiento() {
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            this.existeHacinamiento = inmueble != null && (inmueble.getCantidadHabitaciones() < integrantes.size());
        } catch (ServiceException e) {
            e.printStackTrace();//TODO
        }

    }

    private void setExistePromiscuidad() {
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            this.existePromiscuidad = inmueble != null && (inmueble.getCantidadCamas() < integrantes.size());
        } catch (ServiceException e) {
            e.printStackTrace();//TODO
        }

    }
}
