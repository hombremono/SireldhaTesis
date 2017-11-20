package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 20/11/17.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "instalacionInmueble")
public class InstalacionInmueble {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_InstalacionInmueble;

    @Column(name="severidad", nullable = false)
    private int severidad = 0;

    @Column(name="descripcion", nullable = false)
    private String descripcion = "regular";

    @Column(name="isActive", nullable = false)
    private boolean isActive = true;

    public int getId_InstalacionInmueble() {
        return id_InstalacionInmueble;
    }

    public void setId_InstalacionInmueble(int id_InstalacionInmueble) {
        this.id_InstalacionInmueble = id_InstalacionInmueble;
    }

    public int getSeveridad() {
        return severidad;
    }

    public void setSeveridad(int severidad) {
        this.severidad = severidad;
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
