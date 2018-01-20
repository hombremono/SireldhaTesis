package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "sexo")

public class Sexo extends Plan_Item implements IModel{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Sexo;

    @Column(name="sexo", nullable = false)
    private String sexo;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_Sexo() {
        return id_Sexo;
    }

    public void setId_Sexo(int id_Sexo) {
        this.id_Sexo = id_Sexo;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_Sexo;
    }
}
