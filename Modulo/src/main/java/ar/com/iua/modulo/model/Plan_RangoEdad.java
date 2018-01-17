package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_RangoEdad")
public class Plan_RangoEdad implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Plan_RangoEdad;

    @Column(name = "desde", nullable = false)
    private float desde;

    @Column(name = "hasta", nullable = false)
    private float hasta;

    @Override
    public int getId() {
        return id_Plan_RangoEdad;
    }

    public int getId_RangoEdadr() {
        return id_Plan_RangoEdad;
    }

    public void setId_RangoEdadr(int id_RangoEdadr) {
        this.id_Plan_RangoEdad = id_RangoEdadr;
    }

    public float getDesde() {
        return desde;
    }

    public void setDesde(float desde) {
        this.desde = desde;
    }

    public float getHasta() {
        return hasta;
    }

    public void setHasta(float hasta) {
        this.hasta = hasta;
    }
}
