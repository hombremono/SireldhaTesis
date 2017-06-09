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
@Table(name = "servicioagua")

public class ServicioAgua {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_ServicioAgua;

    @OneToOne
    @JoinColumn(name = "idPoseeAgua")
    private PoseeAgua poseeAgua;

    @OneToOne
    @JoinColumn(name = "idProcedenciaAgua")
    private ProcedenciaAgua procedenciaAgua;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_ServicioAgua() {
        return id_ServicioAgua;
    }

    public void setId_ServicioAgua(int id_ServicioAgua) {
        this.id_ServicioAgua = id_ServicioAgua;
    }

    public PoseeAgua getPoseeAgua() {
        return poseeAgua;
    }

    public void setPoseeAgua(PoseeAgua poseeAgua) {
        this.poseeAgua = poseeAgua;
    }

    public ProcedenciaAgua getProcedenciaAgua() {
        return procedenciaAgua;
    }

    public void setProcedenciaAgua(ProcedenciaAgua procedenciaAgua) {
        this.procedenciaAgua = procedenciaAgua;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
