package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "trabajodependencia")

public class TrabajoDependencia implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_TrabajoDependencia;

    @Column(name="empresa", nullable = false)
    private String empresa;

    @Column(name="fechaIngreso", nullable = false)
    private Date fechaIngreso;

    @OneToOne
    @JoinColumn(name = "idPersona")
    private Persona persona;

    @OneToOne
    @JoinColumn(name = "idTelefono")
    private Telefono telefono;

    @OneToOne
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_TrabajoDependencia() {
        return id_TrabajoDependencia;
    }

    public void setId_TrabajoDependencia(int id_TrabajoDependencia) {
        this.id_TrabajoDependencia = id_TrabajoDependencia;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Telefono getTelefono() {
        return telefono;
    }

    public void setTelefono(Telefono telefono) {
        this.telefono = telefono;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_TrabajoDependencia;
    }
}
