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
@Table(name = "poseeluz")

public class PoseeLuz {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_PoseeLuz;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_PoseeLuz() {
        return id_PoseeLuz;
    }

    public void setId_PoseeLuz(int id_PoseeLuz) {
        this.id_PoseeLuz = id_PoseeLuz;
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
