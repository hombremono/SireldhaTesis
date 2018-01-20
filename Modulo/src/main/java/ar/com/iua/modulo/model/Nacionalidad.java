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
@Table(name = "nacionalidad")

public class Nacionalidad extends Plan_Item implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Nacionalidad;

    @Column(name="descripcion", nullable = false)
    private String descripcion;


    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Nacionalidad() {
        return id_Nacionalidad;
    }

    public void setId_Nacionalidad(int id_Nacionalidad) {
        this.id_Nacionalidad = id_Nacionalidad;
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

    @Override
    public int getId() {
        return id_Nacionalidad;
    }
}
