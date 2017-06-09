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
@Table(name = "motivocarecimiento")

public class MotivoCarecimiento {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_MotivoCarecimiento;

    @Column(name="descripcion", nullable = false)
    private String descripcion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_MotivoCarecimiento() {
        return id_MotivoCarecimiento;
    }

    public void setId_MotivoCarecimiento(int id_MotivoCarecimiento) {
        this.id_MotivoCarecimiento = id_MotivoCarecimiento;
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
