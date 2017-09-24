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
@Table(name = "inmueble")

public class Inmueble implements IModel {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Inmueble;

    @Column(name="cantidadHabitaciones", nullable = false)
    private int cantidadHabitaciones;

    @Column(name="zonaInsalubre", nullable = false)
    private boolean zonaInsalubre;

    @Column(name="cantidadCamas", nullable = false)
    private int cantidadCamas;

    @Column(name="promiscuidad", nullable = false)
    private boolean promiscuidad;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    @OneToOne
    @JoinColumn(name = "idPared" )
    private Pared pared;

    @OneToOne
    @JoinColumn(name = "idMaterialPiso")
    private MaterialPiso materialPiso;

    @OneToOne
    @JoinColumn(name = "idTecho")
    private Techo techo;

    @OneToOne
    @JoinColumn(name = "idPoseeLuz")
    private PoseeLuz poseeLuz;

    @OneToOne
    @JoinColumn(name = "idServicioAgua")
    private ServicioAgua servicioAgua;

    public int getId_Inmueble() {
        return id_Inmueble;
    }

    public void setId_Inmueble(int id_Inmueble) {
        this.id_Inmueble = id_Inmueble;
    }

    public int getCantidadHabitaciones() {
        return cantidadHabitaciones;
    }

    public void setCantidadHabitaciones(int cantidadHabitaciones) {
        this.cantidadHabitaciones = cantidadHabitaciones;
    }

    public int getCantidadCamas() {
        return cantidadCamas;
    }

    public void setCantidadCamas(int cantidadCamas) {
        this.cantidadCamas = cantidadCamas;
    }

    public boolean isPromiscuidad() {
        return promiscuidad;
    }

    public void setPromiscuidad(boolean promiscuidad) {
        this.promiscuidad = promiscuidad;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public Pared getPared() {
        return pared;
    }

    public void setPared(Pared pared) {
        this.pared = pared;
    }

    public MaterialPiso getPiso() {
        return materialPiso;
    }

    public void setPiso(MaterialPiso materialPiso) {
        this.materialPiso = materialPiso;
    }

    public Techo getTecho() {
        return techo;
    }

    public void setTecho(Techo techo) {
        this.techo = techo;
    }

    public PoseeLuz getPoseeLuz() {
        return poseeLuz;
    }

    public void setPoseeLuz(PoseeLuz poseeLuz) {
        this.poseeLuz = poseeLuz;
    }

    public ServicioAgua getServicioAgua() {
        return servicioAgua;
    }

    public void setServicioAgua(ServicioAgua servicioAgua) {
        this.servicioAgua = servicioAgua;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    @Override
    public int getId() {
        return id_Inmueble;
    }
}
