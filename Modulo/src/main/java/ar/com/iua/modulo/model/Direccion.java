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
@Table(name = "direccion")
public class Direccion implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Direccion;

    @Column(name="calle", nullable = false)
    private String calle;

    @Column(name="numero", nullable = false)
    private String numero;

    @Column(name="dpto", nullable = false)
    private String dpto;

    @Column(name="barrio", nullable = false)
    private String barrio;

    @Column(name="latitud", nullable = false)
    private float latitud;

    @Column(name="longitud", nullable = false)
    private float longitud;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idLocalidad", nullable = false)
    private Localidad localidad;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Direccion() {
        return id_Direccion;
    }

    public void setId_Direccion(int id_Direccion) {
        this.id_Direccion = id_Direccion;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getDpto() {
        return dpto;
    }

    public void setDpto(String dpto) {
        this.dpto = dpto;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public float getLatitud() {
        return latitud;
    }

    public void setLatitud(float latitud) {
        this.latitud = latitud;
    }

    public float getLongitud() {
        return longitud;
    }

    public void setLongitud(float longitud) {
        this.longitud = longitud;
    }

    public Localidad getLocalidad() {
        return localidad;
    }

    public void setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }

    public boolean getisActive() {
        return isActive;
    }

    public void setisActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Direccion;
    }
}
