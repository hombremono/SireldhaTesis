package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_SituacionRegistro")
public class Plan_SituacionRegistro implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_SituacionRegistro;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "idConstante", nullable = false)
    private ConstantePlan constante;

    public ConstantePlan getConstante() {
        return constante;
    }

    @Override
    public int getId() {
        return id_SituacionRegistro;
    }

    public int getId_Plan_SituacionRegistro() {
        return id_SituacionRegistro;
    }

    public void setId_Plan_SituacionRegistro(int id_Plan_SituacionRegistro) {
        this.id_SituacionRegistro = id_Plan_SituacionRegistro;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setConstante(ConstantePlan constante) {
        this.constante = constante;
    }
}
