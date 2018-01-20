package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_SituacionHogar")
public class Plan_SituacionHogar implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_SituacionHogar;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "idConstante", nullable = false)
    private ConstantePlan constante;

    public ConstantePlan getConstante() {
        return constante;
    }

    public void setConstante(ConstantePlan constante) {
        this.constante = constante;
    }

    @Override
    public int getId() {
        return id_SituacionHogar;
    }

    public int getId_SituacionHogar() {
        return id_SituacionHogar;
    }

    public void setId_SituacionHogar(int id_SituacionHogar) {
        this.id_SituacionHogar = id_SituacionHogar;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}