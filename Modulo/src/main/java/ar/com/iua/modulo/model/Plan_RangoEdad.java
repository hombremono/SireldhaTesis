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
public class Plan_RangoEdad extends Plan_Item implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_RangoEdad;

    @Column(name = "desde", nullable = false)
    private float desde;

    @Column(name = "hasta", nullable = false)
    private float hasta;

    @Override
    public int getId() {
        return id_RangoEdad;
    }

    public int getId_RangoEdad() {
        return id_RangoEdad;
    }

    public void setId_RangoEdad(int id_RangoEdad) {
        this.id_RangoEdad = id_RangoEdad;
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
