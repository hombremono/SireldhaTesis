package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */
import java.util.Set;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "capacidadconstructiva")
public class CapacidadConstructiva {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_CapacidadConstructiva;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    @ManyToOne
    @JoinColumn(name = "idPersona")
    private Persona persona;

    @OneToOne
    @JoinColumn(name = "idTipoCapacidadConstructiva")
    private TipoCapacidadConstructiva tipoCapacidadConstructiva;

    public int getId_CapacidadConstructiva() {
        return id_CapacidadConstructiva;
    }

    public void setId_CapacidadConstructiva(int id_CapacidadConstructiva) {
        this.id_CapacidadConstructiva = id_CapacidadConstructiva;
    }

    public boolean getActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public TipoCapacidadConstructiva getTipoCapacidadConstructiva() {
        return tipoCapacidadConstructiva;
    }

    public void setTipoCapacidadConstructiva(TipoCapacidadConstructiva tipoCapacidadConstructiva) {
        this.tipoCapacidadConstructiva = tipoCapacidadConstructiva;
    }
}
