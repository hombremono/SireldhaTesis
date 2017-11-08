package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 05/11/17.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Subsidio")
public class Subsidio implements IModel{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Subsidio;

    @Column(name="nacional")
    private boolean nacional;

    @Column(name="provincial")
    private boolean provincial;

    @Column(name="municipal")
    private boolean municipal;


    @Override
    public int getId() {
        return id_Subsidio;
    }

    public int getId_Subsidio() {
        return id_Subsidio;
    }

    public void setId_Subsidio(int id_Subsidio) {
        this.id_Subsidio = id_Subsidio;
    }

    public boolean isNacional() {
        return nacional;
    }

    public void setNacional(boolean nacional) {
        this.nacional = nacional;
    }

    public boolean isProvincial() {
        return provincial;
    }

    public void setProvincial(boolean provincial) {
        this.provincial = provincial;
    }

    public boolean isMunicipal() {
        return municipal;
    }

    public void setMunicipal(boolean municipal) {
        this.municipal = municipal;
    }
}
