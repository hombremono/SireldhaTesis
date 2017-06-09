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
@Table(name = "alquiler")
public class Alquiler {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Alquiler;

    @Column(name="monto", nullable = false)
    private float monto;

    @Column (name="fechaDesde", nullable=false)
    private Date fechaDesde;

    @Column (name="fechaHasta", nullable=false)
    private Date fechaHaSta;

    @Column(name="isActive", nullable=false)
    private boolean isActive;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    public int getIdAlquiler() {
        return id_Alquiler;
    }

    public void setIdAlquiler(int idAlquiler) {
        this.id_Alquiler = idAlquiler;
    }

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHaSta() {
        return fechaHaSta;
    }

    public void setFechaHaSta(Date fechaHaSta) {
        this.fechaHaSta = fechaHaSta;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }
}
