package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.model.*;

import java.io.Serializable;
import java.util.List;

/**
 * Created by mnicolas on 02/08/17.
 */
public class PersonaCombos implements Serializable {
    private static final long serialVersionUID = -1262275932413466908L;
    /*  Tipo Dni
        Sexo
        Estado Civil
        Nacionalidad
        Estudios
        Profesion
        Capacidad Constructiva
        Dependencia Laboral*/

    private List<TipoDocumento> tiposDocumentos;
    private List<Sexo> generos;
    private List<EstadoCivil> estadosCiviles;
    private List<Nacionalidad> nacionalidades;
    private List<Estudios> estudios;
    private List<Profesion> profesiones;
    private List<TipoCapacidadConstructiva> capacidadesConstructivas;
    private List<SituacionLaboral> situacionesLaborales;
    private List<Localidad> localidades;
    private List<RolFamiliar> rolesFamiliares;


    public PersonaCombos(List<TipoDocumento> tiposDocumentos,
                         List<Sexo> generos, List<EstadoCivil> estadosCiviles,
                         List<Nacionalidad> nacionalidades, List<Estudios> estudios,
                         List<Profesion> profesiones, List<TipoCapacidadConstructiva> capacidadesConstructivas,
                         List<SituacionLaboral> situacionesLaborales, List<Localidad> localidades,
                         List<RolFamiliar> rolesFamiliares) {
        this.tiposDocumentos = tiposDocumentos;
        this.generos = generos;
        this.estadosCiviles = estadosCiviles;
        this.nacionalidades = nacionalidades;
        this.estudios = estudios;
        this.profesiones = profesiones;
        this.capacidadesConstructivas = capacidadesConstructivas;
        this.situacionesLaborales = situacionesLaborales;
        this.localidades = localidades;
        this.rolesFamiliares = rolesFamiliares;
    }

    public List<Localidad> getLocalidades() {
        return localidades;
    }

    public void setLocalidades(List<Localidad> localidades) {
        this.localidades = localidades;
    }

    public List<RolFamiliar> getRolesFamiliares() {
        return rolesFamiliares;
    }

    public void setRolesFamiliares(List<RolFamiliar> rolesFamiliares) {
        this.rolesFamiliares = rolesFamiliares;
    }

    public List<TipoDocumento> getTiposDocumentos() {
        return tiposDocumentos;
    }

    public void setTiposDocumentos(List<TipoDocumento> tiposDocumentos) {
        this.tiposDocumentos = tiposDocumentos;
    }

    public List<Sexo> getGeneros() {
        return generos;
    }

    public void setGeneros(List<Sexo> generos) {
        this.generos = generos;
    }

    public List<EstadoCivil> getEstadosCiviles() {
        return estadosCiviles;
    }

    public void setEstadosCiviles(List<EstadoCivil> estadosCiviles) {
        this.estadosCiviles = estadosCiviles;
    }

    public List<Nacionalidad> getNacionalidades() {
        return nacionalidades;
    }

    public void setNacionalidades(List<Nacionalidad> nacionalidades) {
        this.nacionalidades = nacionalidades;
    }

    public List<Estudios> getEstudios() {
        return estudios;
    }

    public void setEstudios(List<Estudios> estudios) {
        this.estudios = estudios;
    }

    public List<Profesion> getProfesiones() {
        return profesiones;
    }

    public void setProfesiones(List<Profesion> profesiones) {
        this.profesiones = profesiones;
    }

    public List<TipoCapacidadConstructiva> getCapacidadesConstructivas() {
        return capacidadesConstructivas;
    }

    public void setCapacidadesConstructivas(List<TipoCapacidadConstructiva> capacidadesConstructivas) {
        this.capacidadesConstructivas = capacidadesConstructivas;
    }

    public List<SituacionLaboral> getSituacionesLaborales() {
        return situacionesLaborales;
    }

    public void setSituacionesLaborales(List<SituacionLaboral> situacionesLaborales) {
        this.situacionesLaborales = situacionesLaborales;
    }
}
