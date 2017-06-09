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
@Table(name = "poseebano")

public class PoseeBano {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_PoseeBano;

    @Column(name="DescargaInodoro", nullable = false)
    private boolean descargaInodoro;


    @Column(name="Compartido", nullable = false)
    private boolean compartido;

    @ManyToOne
    @JoinColumn(name = "idInmueble")
    private Inmueble inmueble;

    @OneToOne
    @JoinColumn(name = "idTipoBano")
    private TipoBano tipoBano;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_PoseeBano() {
        return id_PoseeBano;
    }

    public void setId_PoseeBano(int id_PoseeBano) {
        this.id_PoseeBano = id_PoseeBano;
    }

    public boolean isDescargaInodoro() {
        return descargaInodoro;
    }

    public void setDescargaInodoro(boolean descargaInodoro) {
        this.descargaInodoro = descargaInodoro;
    }

    public boolean isCompartido() {
        return compartido;
    }

    public void setCompartido(boolean compartido) {
        this.compartido = compartido;
    }

    public Inmueble getInmueble() {
        return inmueble;
    }

    public void setInmueble(Inmueble inmueble) {
        this.inmueble = inmueble;
    }

    public TipoBano getTipoBano() {
        return tipoBano;
    }

    public void setTipoBano(TipoBano tipoBano) {
        this.tipoBano = tipoBano;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
