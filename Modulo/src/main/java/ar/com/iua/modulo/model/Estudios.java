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
@Table(name = "estudios")

public class Estudios implements IModel{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Estudios;

    @Column(name="estudios", nullable = false)
    private String estudios;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Estudios() {
        return id_Estudios;
    }

    public void setId_Estudios(int id_Estudios) {
        this.id_Estudios = id_Estudios;
    }

    public String getEstudios() {
        return estudios;
    }

    public void setEstudios(String estudios) {
        this.estudios = estudios;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Estudios;
    }
}
