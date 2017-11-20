package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import java.util.Date;
import java.util.List;
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

    @OneToOne
    @JoinColumn(name = "instalacionAgua")
    private InstalacionInmueble instalacionAgua;

    @OneToOne
    @JoinColumn(name = "instalacionGas")
    private InstalacionInmueble instalacionGas;

    @OneToOne
    @JoinColumn(name = "instalacionCloacal")
    private InstalacionInmueble instalacionCloacal;

    @OneToOne
    @JoinColumn(name = "instalacionElectrica")
    private InstalacionInmueble instalacionElectrica;


    @OneToMany (mappedBy = "inmueble")
    private List<Cocina> cocina;

    @OneToMany (mappedBy = "inmueble")
    private List<PoseeBano> poseeBano;

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

    public boolean isZonaInsalubre() {
        return zonaInsalubre;
    }

    public void setZonaInsalubre(boolean zonaInsalubre) {
        this.zonaInsalubre = zonaInsalubre;
    }

    public MaterialPiso getMaterialPiso() {
        return materialPiso;
    }

    public void setMaterialPiso(MaterialPiso materialPiso) {
        this.materialPiso = materialPiso;
    }

    public List<Cocina> getCocina() {
        return cocina;
    }

    public void setCocina(List<Cocina> cocina) {
        this.cocina = cocina;
    }

    public List<PoseeBano> getPoseeBano() {
        return poseeBano;
    }

    public void setPoseeBano(List<PoseeBano> poseeBano) {
        this.poseeBano = poseeBano;
    }

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    @Override
    public int getId() {
        return id_Inmueble;
    }

    public InstalacionInmueble getInstalacionAgua() {
        return instalacionAgua;
    }

    public void setInstalacionAgua(InstalacionInmueble instalacionAgua) {
        this.instalacionAgua = instalacionAgua;
    }

    public InstalacionInmueble getInstalacionGas() {
        return instalacionGas;
    }

    public void setInstalacionGas(InstalacionInmueble instalacionGas) {
        this.instalacionGas = instalacionGas;
    }

    public InstalacionInmueble getInstalacionCloacal() {
        return instalacionCloacal;
    }

    public void setInstalacionCloacal(InstalacionInmueble instalacionCloacal) {
        this.instalacionCloacal = instalacionCloacal;
    }

    public InstalacionInmueble getInstalacionElectrica() {
        return instalacionElectrica;
    }

    public void setInstalacionElectrica(InstalacionInmueble instalacionElectrica) {
        this.instalacionElectrica = instalacionElectrica;
    }
}
