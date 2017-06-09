package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "credito")
public class Credito {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Credito;

    @Column(name="entidad", nullable = false)
    private String enitdad;
    @Column(name="monto", nullable = false)
    private float monto;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Credito() {
        return id_Credito;
    }

    public void setId_Credito(int id_Credito) {
        this.id_Credito = id_Credito;
    }

    public String getEnitdad() {
        return enitdad;
    }

    public void setEnitdad(String enitdad) {
        this.enitdad = enitdad;
    }

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
