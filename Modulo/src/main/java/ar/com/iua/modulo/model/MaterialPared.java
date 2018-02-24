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
@Table(name = "materialpared")

public class MaterialPared extends Plan_Item {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_MaterialPared;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_MaterialPared() {
        return id_MaterialPared;
    }

    public void setId_MaterialPared(int id_MaterialPared) {
        this.id_MaterialPared = id_MaterialPared;
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
