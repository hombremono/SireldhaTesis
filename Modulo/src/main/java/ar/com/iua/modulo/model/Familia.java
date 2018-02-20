package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import javax.persistence.*;

import org.hibernate.annotations.Proxy;

import java.util.Date;

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "familia")

public class Familia implements IModel{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Familia;

    @Column(name = "ingresoNetoFamiliar", nullable = false)
    private float ingresoNetoFamiliar;

    @Column(name = "tarjetaCredito", nullable = false)
    private boolean tarjetaCredito;

    //en años
    @Column(name = "antiguedadResidencia", nullable = false)
    private int antiguedadResidencia;

    @Column(name = "isActive", nullable = false)
    private boolean isActive;

    @Column(name = "fechaAlta")
    private Date fechaAlta;

    @Column(name = "codigoDeAlta")
    private String codigoDeAlta;

    @Column(name = "documentacionCompleta", nullable = false)
    private boolean documentacionCompleta;

    @ManyToOne
    @JoinColumn(name = "idSolucionHabitacional")
    private SolucionHabitacional solucionHabitacional;

    @ManyToOne
    @JoinColumn(name = "idSituacionInmueble")
    private SituacionInmueble situacionInmueble;

    @ManyToOne
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @ManyToOne
    @JoinColumn(name="idTelefono")
    private Telefono telefono;

    public int getId_Familia() {
        return id_Familia;
    }

    public void setId_Familia(int id_Familia) {
        this.id_Familia = id_Familia;
    }

    public float getIngresoNetoFamiliar() {
        return ingresoNetoFamiliar;
    }

    public void setIngresoNetoFamiliar(float ingresoNetoFamiliar) {
        this.ingresoNetoFamiliar = ingresoNetoFamiliar;
    }

    public boolean isTarjetaCredito() {
        return tarjetaCredito;
    }

    public void setTarjetaCredito(boolean tarjetaCredito) {
        this.tarjetaCredito = tarjetaCredito;
    }

    public int isAntiguedadResidencia() {
        return antiguedadResidencia;
    }

    public void setAntiguedadResidencia(int antiguedadResidencia) {
        this.antiguedadResidencia = antiguedadResidencia;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public SolucionHabitacional getSolucionHabitacional() {
        return solucionHabitacional;
    }

    public void setSolucionHabitacional(SolucionHabitacional solucionHabitacional) {
        this.solucionHabitacional = solucionHabitacional;
    }

    public SituacionInmueble getSituacionInmueble() {
        return situacionInmueble;
    }

    public void setSituacionInmueble(SituacionInmueble situacionInmueble) {
        this.situacionInmueble = situacionInmueble;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public Telefono getTelefono() {
        return telefono;
    }

    public void setTelefono(Telefono telefono) {
        this.telefono = telefono;
    }

    public int getAntiguedadResidencia() {
        return antiguedadResidencia;
    }

    public boolean isDocumentacionCompleta() {
        return documentacionCompleta;
    }

    public void setDocumentacionCompleta(boolean documentacionCompleta) {
        this.documentacionCompleta = documentacionCompleta;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public String getCodigoDeAlta() {
        return codigoDeAlta;
    }

    public void setCodigoDeAlta(String codigoDeAlta) {
        this.codigoDeAlta = codigoDeAlta;
    }

    @Override
    public int getId() {
        return id_Familia;
    }
}
