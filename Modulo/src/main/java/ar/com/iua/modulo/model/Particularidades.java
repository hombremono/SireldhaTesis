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
@Table(name = "particularidades")

public class Particularidades {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Particularidades;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    @OneToOne
    @JoinColumn(name = "idCaracteristicaPArticular")
    private CaracteristicaParticular caracteristicaParticular;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Particularidades() {
        return id_Particularidades;
    }

    public void setId_Particularidades(int id_Particularidades) {
        this.id_Particularidades = id_Particularidades;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public CaracteristicaParticular getCaracteristicaParticular() {
        return caracteristicaParticular;
    }

    public void setCaracteristicaParticular(CaracteristicaParticular caracteristicaParticular) {
        this.caracteristicaParticular = caracteristicaParticular;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
