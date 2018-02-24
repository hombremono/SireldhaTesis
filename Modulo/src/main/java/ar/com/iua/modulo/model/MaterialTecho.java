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
@Table(name = "materialtecho")

public class MaterialTecho extends Plan_Item{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_MaterialTecho;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_MaterialTecho() {
        return id_MaterialTecho;
    }

    public void setId_MaterialTecho(int id_MaterialTecho) {
        this.id_MaterialTecho = id_MaterialTecho;
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
}
