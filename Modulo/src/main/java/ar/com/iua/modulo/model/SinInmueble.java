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
@Table(name = "sininmueble")

public class SinInmueble {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_SinInmueble;


    @Column(name="ocupacionTerrenoFiscal", nullable = false)
    private boolean ocupacionTerrenoFiscal;

    @Column(name="ocupacionTerrenoPrivado", nullable = false)
    private boolean ocupacionTerrenoPrivado;

    @Column(name="comodatoEstado", nullable = false)
    private boolean comodatoEstado;

    @Column(name="comodatoTrabajo", nullable = false)
    private boolean comodatoTrabajo;

    @Column(name="comodatoPariente", nullable = false)
    private boolean comodatoPariente;

    @OneToOne
    @JoinColumn(name = "idCareceVivienda")
    private CareceVivienda careceVivienda;

    @OneToOne
    @JoinColumn(name = "idAlquiler")
    private Alquiler alquiler;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_SinInmueble() {
        return id_SinInmueble;
    }

    public void setId_SinInmueble(int id_SinInmueble) {
        this.id_SinInmueble = id_SinInmueble;
    }

    public boolean isOcupacionTerrenoFiscal() {
        return ocupacionTerrenoFiscal;
    }

    public void setOcupacionTerrenoFiscal(boolean ocupacionTerrenoFiscal) {
        this.ocupacionTerrenoFiscal = ocupacionTerrenoFiscal;
    }

    public boolean isOcupacionTerrenoPrivado() {
        return ocupacionTerrenoPrivado;
    }

    public void setOcupacionTerrenoPrivado(boolean ocupacionTerrenoPrivado) {
        this.ocupacionTerrenoPrivado = ocupacionTerrenoPrivado;
    }

    public boolean isComodatoEstado() {
        return comodatoEstado;
    }

    public void setComodatoEstado(boolean comodatoEstado) {
        this.comodatoEstado = comodatoEstado;
    }

    public boolean isComodatoTrabajo() {
        return comodatoTrabajo;
    }

    public void setComodatoTrabajo(boolean comodatoTrabajo) {
        this.comodatoTrabajo = comodatoTrabajo;
    }

    public boolean isComodatoPariente() {
        return comodatoPariente;
    }

    public void setComodatoPariente(boolean comodatoPariente) {
        this.comodatoPariente = comodatoPariente;
    }

    public CareceVivienda getCareceVivienda() {
        return careceVivienda;
    }

    public void setCareceVivienda(CareceVivienda careceVivienda) {
        this.careceVivienda = careceVivienda;
    }

    public Alquiler getAlquiler() {
        return alquiler;
    }

    public void setAlquiler(Alquiler alquiler) {
        this.alquiler = alquiler;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
