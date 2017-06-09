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
@Table(name = "rolfamiliar")

public class RolFamiliar implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_RolFamiliar;

    @Column(name="rolFamiliar", nullable = false)
    private String rolFamiliar;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_RolFamiliar() {
        return id_RolFamiliar;
    }

    public void setId_RolFamiliar(int id_RolFamiliar) {
        this.id_RolFamiliar = id_RolFamiliar;
    }

    public String getRolFamiliar() {
        return rolFamiliar;
    }

    public void setRolFamiliar(String rolFamiliar) {
        this.rolFamiliar = rolFamiliar;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_RolFamiliar;
    }
}
