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
@Table(name = "tipodocumento")

public class TipoDocumento implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_TipoDocumento;

    @Column(name="tipo", nullable = false)
    private String tipo;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_TipoDocumento() {
        return id_TipoDocumento;
    }

    public void setId_TipoDocumento(int id_TipoDocumento) {
        this.id_TipoDocumento = id_TipoDocumento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_TipoDocumento;
    }
}
