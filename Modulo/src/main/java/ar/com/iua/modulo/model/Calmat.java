package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 24/02/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "calmat")
public class Calmat implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="categoriaPiso", nullable = false)
    private int categoriaPiso;

    @Column(name="categoriaTecho", nullable = false)
    private int categoriaTecho;

    @Column(name="categoriaPared", nullable = false)
    private int categoriaPared;

    @ManyToOne
    @JoinColumn(name = "idConstanteCalmat")
    private ConstantePlan constanteCalmat;

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoriaPiso() {
        return categoriaPiso;
    }

    public void setCategoriaPiso(int categoriaPiso) {
        this.categoriaPiso = categoriaPiso;
    }

    public int getCategoriaTecho() {
        return categoriaTecho;
    }

    public void setCategoriaTecho(int categoriaTecho) {
        this.categoriaTecho = categoriaTecho;
    }

    public int getCategoriaPared() {
        return categoriaPared;
    }

    public void setCategoriaPared(int categoriaPared) {
        this.categoriaPared = categoriaPared;
    }

    public ConstantePlan getConstanteCalmat() {
        return constanteCalmat;
    }

    public void setConstanteCalmat(ConstantePlan constanteCalmat) {
        this.constanteCalmat = constanteCalmat;
    }

    @Override
    public int getId() {
        return id;
    }
}
