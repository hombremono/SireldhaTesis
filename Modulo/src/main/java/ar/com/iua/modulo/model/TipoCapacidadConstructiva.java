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
@Table(name = "tipocapacidadconstructiva")

public class TipoCapacidadConstructiva extends Plan_Item {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_TipoCapacidadConstructiva;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_TipoCapacidadConstructiva() {
        return id_TipoCapacidadConstructiva;
    }

    public void setId_TipoCapacidadConstructiva(int id_TipoCapacidadConstructiva) {
        this.id_TipoCapacidadConstructiva = id_TipoCapacidadConstructiva;
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
