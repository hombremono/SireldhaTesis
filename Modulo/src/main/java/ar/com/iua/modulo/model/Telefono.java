package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "telefono")

public class Telefono implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Telefono;

    @Column(name="numero", nullable = false)
    private String numero;

    @Column(name="celular", nullable = false)
    private boolean celular;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Telefono() {
        return id_Telefono;
    }

    public void setId_Telefono(int id_Telefono) {
        this.id_Telefono = id_Telefono;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public boolean isCelular() {
        return celular;
    }

    public void setCelular(boolean celular) {
        this.celular = celular;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Telefono;
    }
}
