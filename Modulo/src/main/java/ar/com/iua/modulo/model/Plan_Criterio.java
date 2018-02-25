package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.List;

/**
 * Created by mnicolas on 28/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_Criterio")
public class Plan_Criterio implements IModel{

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_Constante", nullable = false)
    private ConstantePlan constante;

    @Column(name="puntaje")
    private float Puntaje;

    @Column(name="requerido")
    private boolean requerido;

    @Column(name="valor")
    private float valor;

    @ManyToOne
    @JoinColumn(name = "idPlan")
    private Plan plan;

    @Override
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ConstantePlan getConstante() {
        return constante;
    }

    public void setConstante(ConstantePlan constante) {
        this.constante = constante;
    }

    public float getPuntaje() {
        return Puntaje;
    }

    public void setPuntaje(float puntaje) {
        Puntaje = puntaje;
    }

    public boolean isRequerido() {
        return requerido;
    }

    public void setRequerido(boolean requerido) {
        this.requerido = requerido;
    }


    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
}
