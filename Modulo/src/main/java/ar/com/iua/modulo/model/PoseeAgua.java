package ar.com.iua.modulo.model;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "poseeagua")

public class PoseeAgua {


    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_PoseeAgua;

    @Column(name="descripcion", nullable = false)
    private String descripcion;


    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_PoseeAgua() {
        return id_PoseeAgua;
    }

    public void setId_PoseeAgua(int id_PoseeAgua) {
        this.id_PoseeAgua = id_PoseeAgua;
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
