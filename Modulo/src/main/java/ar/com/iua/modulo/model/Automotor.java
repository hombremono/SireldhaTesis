package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "automotor")
public class Automotor {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Automotor;

    @Column(name="marca", nullable = false)
    private String marca;

    @Column(name="modelo", nullable = false)
    private String modelo;

    @Column(name="anio", nullable = false)
    private String anio;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    public int getIdAutomotor() {
        return id_Automotor;
    }

    public void setIdAutomotor(int idAutomotor) {
        this.id_Automotor = idAutomotor;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }
}
