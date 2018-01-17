package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_CaracteristicasHogar")
public class Plan_CaracteristicasHogar implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Plan_CaracteristicasHogar;

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
        return id_Plan_CaracteristicasHogar;
    }

    public int getId_CaracteristicasEspecialesHogar() {
        return id_Plan_CaracteristicasHogar;
    }

    public void setId_CaracteristicasEspecialesHogar(int id_CaracteristicasEspecialesHogar) {
        this.id_Plan_CaracteristicasHogar = id_CaracteristicasEspecialesHogar;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
