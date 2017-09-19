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
@Table(name = "terreno")

public class Terreno implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Terreno;

    @Column(name="valorFiscal", nullable = false)
    private float valorFiscal;

    @Column(name="superficie", nullable = false)
    private float superficie;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;


    @OneToOne
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @Column(name="edificacion", nullable = false)
    private boolean edificacion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;



    public int getId_Terreno() {
        return id_Terreno;
    }

    public void setId_Terreno(int id_Terreno) {
        this.id_Terreno = id_Terreno;
    }

    public float getValorFiscal() {
        return valorFiscal;
    }

    public void setValorFiscal(float valorFiscal) {
        this.valorFiscal = valorFiscal;
    }

    public float getSuperficie() {
        return superficie;
    }

    public void setSuperficie(float superficie) {
        this.superficie = superficie;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public boolean isEdificacion() {
        return edificacion;
    }

    public void setEdificacion(boolean edificacion) {
        this.edificacion = edificacion;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Terreno;
    }
}
