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
@Table(name = "situacionlaboral")

public class SituacionLaboral implements IModel {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_DependenciaLaboral;

    @Column(name="dependenciaLaboral", nullable = false)
    private String dependenciaLaboral;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_DependenciaLaboral() {
        return id_DependenciaLaboral;
    }

    public void setId_DependenciaLaboral(int id_DependenciaLaboral) {
        this.id_DependenciaLaboral = id_DependenciaLaboral;
    }

    public String getDependenciaLaboral() {
        return dependenciaLaboral;
    }

    public void setDependenciaLaboral(String dependenciaLaboral) {
        this.dependenciaLaboral = dependenciaLaboral;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_DependenciaLaboral;
    }
}
