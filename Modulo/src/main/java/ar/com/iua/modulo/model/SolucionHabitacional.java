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
@Table(name = "solucionhabitacional")

public class SolucionHabitacional {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_SolucionHabitacional;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_SolucionHabitacional() {
        return id_SolucionHabitacional;
    }

    public void setId_SolucionHabitacional(int id_SolucionHabitacional) {
        this.id_SolucionHabitacional = id_SolucionHabitacional;
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
