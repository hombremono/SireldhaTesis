package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "constantePlan")
public class ConstantePlan implements IModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Constante;

    @Column(name = "grupo", nullable = false)
    private String grupo;

    @Column(name = "constante", nullable = false)
    private String constante;

    @Override
    public int getId() {
        return id_Constante;
    }

    public int getId_Constante() {
        return id_Constante;
    }

    public void setId_Constante(int id_Constante) {
        this.id_Constante = id_Constante;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getConstante() {
        return constante;
    }

    public void setConstante(String constante) {
        this.constante = constante;
    }
}