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
@Table(name = "caracteristicaparticular")
public class CaracteristicaParticular {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_CaracteristicaParticular;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_CaracteristicaParticular() {
        return id_CaracteristicaParticular;
    }

    public void setId_CaracteristicaParticular(int id_CaracteristicaParticular) {
        this.id_CaracteristicaParticular = id_CaracteristicaParticular;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean getActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
