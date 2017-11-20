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
@Table(name = "techo")

public class Techo {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Techo;

    @OneToOne
    @JoinColumn(name = "idTipoTecho")
    private MaterialTecho materialTecho;

    @Column(name="isActive", nullable = false)
    private boolean isActive = true;

    @Column(name="humedad", nullable = false)
    private boolean humedad = false;

    @Column(name="grietas", nullable = false)
    private boolean grietas = false;

    @Column(name="CieloRazo", nullable = false)
    private boolean cieloRazo = false;

    public int getId_Techo() {
        return id_Techo;
    }

    public void setId_Techo(int id_Techo) {
        this.id_Techo = id_Techo;
    }

    public MaterialTecho getTipoTecho() {
        return materialTecho;
    }

    public void setTipoTecho(MaterialTecho materialTecho) {
        this.materialTecho = materialTecho;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isCieloRazo() {
        return cieloRazo;
    }

    public void setCieloRazo(boolean cieloRazo) {
        this.cieloRazo = cieloRazo;
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
}
