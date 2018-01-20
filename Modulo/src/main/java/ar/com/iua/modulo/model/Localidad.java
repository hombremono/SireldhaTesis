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
@Table(name = "localidad")

public class Localidad extends Plan_Item implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Localidad;

    @Column(name="localidad", nullable = false)
    private String localidad;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Localidad() {
        return id_Localidad;
    }

    public void setId_Localidad(int id_Localidad) {
        this.id_Localidad = id_Localidad;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public boolean getisActive() {
        return isActive;
    }

    public void setisActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Localidad;
    }
}
