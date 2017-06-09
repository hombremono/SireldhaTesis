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
@Table(name = "profesion")

public class Profesion implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Profesion;

    @Column(name="profesion", nullable = false)
    private String profesion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Profesion() {
        return id_Profesion;
    }

    public void setId_Profesion(int id_Profesion) {
        this.id_Profesion = id_Profesion;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Profesion;
    }
}
