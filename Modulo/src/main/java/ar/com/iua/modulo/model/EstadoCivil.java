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
@Table(name = "estadocivil")

public class EstadoCivil implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_EstadoCivil;

    @Column(name="estadoCivil", nullable = false)
    private String estadoCivil;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_EstadoCivil() {
        return id_EstadoCivil;
    }

    public void setId_EstadoCivil(int id_EstadoCivil) {
        this.id_EstadoCivil = id_EstadoCivil;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_EstadoCivil;
    }
}
