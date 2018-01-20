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
public class Plan_CaracteristicasHogar extends Plan_Item implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_CaracteristicasEspecialesHogar;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @Override
    public int getId() {
        return id_CaracteristicasEspecialesHogar;
    }

    public int getId_CaracteristicasEspecialesHogar() {
        return id_CaracteristicasEspecialesHogar;
    }

    public void setId_CaracteristicasEspecialesHogar(int id_CaracteristicasEspecialesHogar) {
        this.id_CaracteristicasEspecialesHogar = id_CaracteristicasEspecialesHogar;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
