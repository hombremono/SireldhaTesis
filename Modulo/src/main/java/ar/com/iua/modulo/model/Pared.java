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
@Table(name = "pared")

public class Pared {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Pared;

    @Column(name="revoqueInterior", nullable = false)
    private boolean revoqueInterior= false;

    @Column(name="revoqueExterior", nullable = false)
    private boolean revoqueExterior = false;

    @Column(name="humedad", nullable = false)
    private boolean humedad = false;

    @Column(name="grietas", nullable = false)
    private boolean grietas = false;

    @OneToOne
    @JoinColumn(name = "idTipoPared")
    private MaterialPared materialPared;

    @Column(name="isActive", nullable = false)
    private boolean isActive = true;

    public int getId_Pared() {
        return id_Pared;
    }

    public void setId_Pared(int id_Pared) {
        this.id_Pared = id_Pared;
    }

    public boolean isRevoqueInterior() {
        return revoqueInterior;
    }

    public void setRevoqueInterior(boolean revoqueInterior) {
        this.revoqueInterior = revoqueInterior;
    }

    public boolean isRevoqueExterior() {
        return revoqueExterior;
    }

    public void setRevoqueExterior(boolean revoqueExterior) {
        this.revoqueExterior = revoqueExterior;
    }

    public MaterialPared getTipoPared() {
        return materialPared;
    }

    public void setTipoPared(MaterialPared materialPared) {
        this.materialPared = materialPared;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isHumedad() {
        return humedad;
    }

    public void setHumedad(boolean humedad) {
        this.humedad = humedad;
    }

    public boolean isGrietas() {
        return grietas;
    }

    public void setGrietas(boolean grietas) {
        this.grietas = grietas;
    }

    public MaterialPared getMaterialPared() {
        return materialPared;
    }

    public void setMaterialPared(MaterialPared materialPared) {
        this.materialPared = materialPared;
    }
}
