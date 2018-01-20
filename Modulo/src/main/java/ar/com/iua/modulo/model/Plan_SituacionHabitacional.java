package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_SituacionHabitacional")
public class Plan_SituacionHabitacional implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Plan_SituacionHabitacional;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "idConstante", nullable = false)
    private ConstantePlan constante;

    @Override
    public int getId() {
        return id_Plan_SituacionHabitacional;
    }

    public int getId_Plan_SituacionHabitacional() {
        return id_Plan_SituacionHabitacional;
    }

    public void setId_Plan_SituacionHabitacional(int id_Plan_SituacionHabitacional) {
        this.id_Plan_SituacionHabitacional = id_Plan_SituacionHabitacional;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public ConstantePlan getConstante() {
        return constante;
    }

    public void setConstante(ConstantePlan constante) {
        this.constante = constante;
    }
}
