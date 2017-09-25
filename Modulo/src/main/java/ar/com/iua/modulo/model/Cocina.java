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
@Table(name = "cocina")
public class Cocina {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Cocina;

    @Column(name="instalacionDeAgua", nullable = false)
    private boolean instalacionDeAgua;

    @OneToOne
    @JoinColumn(name = "idTipoCocina")
    private TipoCocina tipoCocina;

    @ManyToOne
    @JoinColumn(name = "id_Inmueble")
    private Inmueble inmueble;

    @Column(name="isActive", nullable = false)
    private Boolean isActive;

    public int getId_Cocina() {
        return id_Cocina;
    }

    public void setId_Cocina(int id_Cocina) {
        this.id_Cocina = id_Cocina;
    }

    public boolean isInstalacionDeAgua() {
        return instalacionDeAgua;
    }

    public void setInstalacionDeAgua(boolean instalacionDeAgua) {
        this.instalacionDeAgua = instalacionDeAgua;
    }

    public TipoCocina getTipoCocina() {
        return tipoCocina;
    }

    public void setTipoCocina(TipoCocina tipoCocina) {
        this.tipoCocina = tipoCocina;
    }

//    public Inmueble getInmueble() {
//        return inmueble;
//    }

    public void setInmueble(Inmueble inmueble) {
        this.inmueble = inmueble;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }
}
