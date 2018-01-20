package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 15/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "PoseeInmueble")
public class PoseeInmueble extends Plan_Item implements IModel{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_PoseeInmueble;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    public int getId_PoseeInmueble() {
        return id_PoseeInmueble;
    }

    public void setId_PoseeInmueble(int id_PoseeInmueble) {
        this.id_PoseeInmueble = id_PoseeInmueble;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int getId() {
        return id_PoseeInmueble;
    }
}
