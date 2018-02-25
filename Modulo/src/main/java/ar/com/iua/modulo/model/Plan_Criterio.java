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
    private String valor;

    @ManyToOne
    @JoinColumn(name = "idPlan")
    private Plan plan;

    @ManyToOne
    @JoinColumn(name = "idOperadorLogico")
    private ConstantePlan constanteOperador;

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

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public ConstantePlan getConstanteOperador() {
        return constanteOperador;
    }

    public void setConstanteOperador(ConstantePlan constanteOperador) {
        this.constanteOperador = constanteOperador;
    }
}
