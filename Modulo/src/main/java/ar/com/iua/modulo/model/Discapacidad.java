package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 07/10/17.
 */

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "discapacidad")
public class Discapacidad implements IModel{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Discapacidad;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    @Override
    public int getId() {
        return id_Discapacidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public int getId_Discapacidad() {
        return id_Discapacidad;
    }

    public void setId_Discapacidad(int id_Discapacidad) {
        this.id_Discapacidad = id_Discapacidad;
    }
}
