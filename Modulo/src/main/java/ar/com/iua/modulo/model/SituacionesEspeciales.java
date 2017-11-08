package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 05/11/17.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "SituacionesEspeciales")
public class SituacionesEspeciales implements IModel{

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id_SituacionesEspeciales;

    @Column(name="enfermedadCronica")
    private boolean enfermedadCronica;

    @Column(name="excombatiente")
    private boolean excombatiente;

    @Column(name="victimaViolencia")
    private boolean victimaViolencia;

    @Column(name="asociacionGremio")
    private boolean asociacionGremio;

    @Column(name="asociacionEntidadPublica")
    private boolean asociacionEntidadPublica;

    @Override
    public int getId() {
        return id_SituacionesEspeciales;
    }

    public int getId_SituacionesEspeciales() {
        return id_SituacionesEspeciales;
    }

    public void setId_SituacionesEspeciales(int id_SituacionesEspeciales) {
        this.id_SituacionesEspeciales = id_SituacionesEspeciales;
    }

    public boolean isEnfermedadCronica() {
        return enfermedadCronica;
    }

    public void setEnfermedadCronica(boolean enfermedadCronica) {
        this.enfermedadCronica = enfermedadCronica;
    }

    public boolean isExcombatiente() {
        return excombatiente;
    }

    public void setExcombatiente(boolean excombatiente) {
        this.excombatiente = excombatiente;
    }

    public boolean isVictimaViolencia() {
        return victimaViolencia;
    }

    public void setVictimaViolencia(boolean victimaViolencia) {
        this.victimaViolencia = victimaViolencia;
    }

    public boolean isAsociacionGremio() {
        return asociacionGremio;
    }

    public void setAsociacionGremio(boolean asociacionGremio) {
        this.asociacionGremio = asociacionGremio;
    }

    public boolean isAsociacionEntidadPublica() {
        return asociacionEntidadPublica;
    }

    public void setAsociacionEntidadPublica(boolean asociacionEntidadPublica) {
        this.asociacionEntidadPublica = asociacionEntidadPublica;
    }
}
