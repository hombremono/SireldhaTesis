package ar.com.iua.modulo.model;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "plan")

public class Plan {
    public int getId_Plan() {
        return id_Plan;
    }

    public void setId_Plan(int id_Plan) {
        this.id_Plan = id_Plan;
    }

    public SolucionHabitacional getSolucionHabitacional() {
        return solucionHabitacional;
    }

    public void setSolucionHabitacional(SolucionHabitacional solucionHabitacional) {
        this.solucionHabitacional = solucionHabitacional;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Plan;

    @ManyToOne
    @JoinColumn(name = "idSolucionHabitacional")
    private SolucionHabitacional solucionHabitacional;

    @Column(name="fechaAlta", nullable = false)
    private Date fechaAlta;

    @Column(name="IsActive", nullable = false)
    private boolean isActive;
}
