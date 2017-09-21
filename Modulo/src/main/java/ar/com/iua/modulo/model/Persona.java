package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */
import java.util.Date;
import java.util.Set;

import javax.persistence.*;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "persona")
public class Persona implements IModel {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Persona;

    @Column(name="nombre", nullable = false)
    private String nombre;

    @Column(name="apellido", nullable = false)
    private String apellido;

    @Column(name="nroDocumento", nullable = false)
    private String nroDocumento;

    @Column(name="nroCuil", nullable = false)
    private String nroCuil;

    @Column(name="fechaNacimiento", nullable = false)
    private Date fechaNacimiento;

    @Column(name="ingresoNeto", nullable = false)
    private float ingresoNeto;

    @Column(name="discapacidad")
    private boolean discapacidad;


    @Column(name="mail", nullable = false)
    private String mail;

    @Column(name="nroCarnetJubilacion")
    private String nroCarnetJubilacion;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idTipoDocumento", nullable = false)
    private TipoDocumento tipoDocumento;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idFamilia", nullable = false)
    private Familia familia;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idDependenciaLaboral", nullable = false)
    private SituacionLaboral situacionLaboral;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idSexo", nullable = false)
    private Sexo sexo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idEstadoCivil", nullable = false)
    private EstadoCivil estadoCivil;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idNacionalidad", nullable = false)
    private Nacionalidad nacionalidad;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idLocalidad", nullable = false)
    private Localidad localidad;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idEstudios", nullable = false)
    private Estudios estudios;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idProfesion")
    private Profesion profesion;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idTelefono")
    private Telefono telefono;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idRolFamiliar", nullable = false)
    private RolFamiliar rolFamiliar;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idTipoCapacidadConstructiva")
    private TipoCapacidadConstructiva tipoCapacidadConstructiva;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public RolFamiliar getRolFamiliar() {
        return rolFamiliar;
    }

    public void setRolFamiliar(RolFamiliar rolFamiliar) {
        this.rolFamiliar = rolFamiliar;
    }

    public int getId_Persona() {
        return id_Persona;
    }

    public void setId_Persona(int id_Persona) {
        this.id_Persona = id_Persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNroDocumento() {
        return nroDocumento;
    }

    public void setNroDocumento(String nroDocumento) {
        this.nroDocumento = nroDocumento;
    }

    public String getNroCuil() {
        return nroCuil;
    }

    public void setNroCuil(String nroCuil) {
        this.nroCuil = nroCuil;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public float getIngresoNeto() {
        return ingresoNeto;
    }

    public void setIngresoNeto(float ingresoNeto) {
        this.ingresoNeto = ingresoNeto;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNroCarnetJubilacion() {
        return nroCarnetJubilacion;
    }

    public void setNroCarnetJubilacion(String nroCarnetJubilacion) {
        this.nroCarnetJubilacion = nroCarnetJubilacion;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public SituacionLaboral getSituacionLaboral() {
        return situacionLaboral;
    }

    public void setSituacionLaboral(SituacionLaboral situacionLaboral) {
        this.situacionLaboral = situacionLaboral;
    }

    public Sexo getSexo() {
        return sexo;
    }

    public void setSexo(Sexo sexo) {
        this.sexo = sexo;
    }

    public EstadoCivil getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public Nacionalidad getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(Nacionalidad nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public Localidad getLocalidad() {
        return localidad;
    }

    public void setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }

    public Estudios getEstudios() {
        return estudios;
    }

    public void setEstudios(Estudios estudios) {
        this.estudios = estudios;
    }

    public Profesion getProfesion() {
        return profesion;
    }

    public void setProfesion(Profesion profesion) {
        this.profesion = profesion;
    }

    public Telefono getTelefono() {
        return telefono;
    }

    public void setTelefono(Telefono telefono) {
        this.telefono = telefono;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Persona;
    }

    public TipoCapacidadConstructiva getTipoCapacidadConstructiva() {
        return tipoCapacidadConstructiva;
    }

    public void setTipoCapacidadConstructiva(TipoCapacidadConstructiva tipoCapacidadConstructiva) {
        this.tipoCapacidadConstructiva = tipoCapacidadConstructiva;
    }

    public boolean isDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(boolean discapacidad) {
        this.discapacidad = discapacidad;
    }
}
