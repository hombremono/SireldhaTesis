package ar.com.iua.modulo.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;

/**
 * Created by mnicolas on 14/01/18.
 */
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "Plan_Calmat")
public class Plan_Calmat implements IModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_Plan_Calmat;

    @Column(name = "indice", nullable = false)
    private int indice;


    @Override
    public int getId() {
        return id_Plan_Calmat;
    }

    public int getId_Plan_Calmat() {
        return id_Plan_Calmat;
    }

    public void setId_Plan_Calmat(int id_Plan_Calmat) {
        this.id_Plan_Calmat = id_Plan_Calmat;
    }

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

}
