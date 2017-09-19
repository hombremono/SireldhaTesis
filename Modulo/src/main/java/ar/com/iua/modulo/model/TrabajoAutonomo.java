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
@Table(name = "trabajoautonomo")

public class TrabajoAutonomo implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_TrabajoAutonomo;

    @OneToOne
    @JoinColumn(name = "idPersona")
    private Persona persona;

    @Column(name="fechaInicioActividades", nullable = false)
    private Date fechaInicioActividades;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_TrabajoAutonomo() {
        return id_TrabajoAutonomo;
    }

    public void setId_TrabajoAutonomo(int id_TrabajoAutonomo) {
        this.id_TrabajoAutonomo = id_TrabajoAutonomo;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Date getFechaInicioActividades() {
        return fechaInicioActividades;
    }

    public void setFechaInicioActividades(Date fechaInicioActividades) {
        this.fechaInicioActividades = fechaInicioActividades;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_TrabajoAutonomo;
    }
}
