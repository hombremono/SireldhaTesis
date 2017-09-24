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

    @Column(name="revoque", nullable = false)
    private boolean revoque;

    @OneToOne
    @JoinColumn(name = "idTipoPared")
    private MaterialPared materialPared;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Pared() {
        return id_Pared;
    }

    public void setId_Pared(int id_Pared) {
        this.id_Pared = id_Pared;
    }

    public boolean isRevoque() {
        return revoque;
    }

    public void setRevoque(boolean revoque) {
        this.revoque = revoque;
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
}
