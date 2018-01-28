package ar.com.iua.modulo.model;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "plan")
public class Plan implements IModel{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Plan;

    @ManyToOne
    @JoinColumn(name = "idSolucionHabitacional")
    private SolucionHabitacional solucionHabitacional;

    @Column(name="nombre")
    private String nombre;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idOrigenFinanciamiento")
    private OrigenFinanciamiento origenFinanciamiento;

    @OneToMany (mappedBy = "plan")
    private List<Plan_Criterio> planCriterioList;

    @Column(name="fechaAlta", nullable = false)
    private Date fechaAlta;

    @Column(name="IsActive", nullable = false)
    private boolean isActive;

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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public OrigenFinanciamiento getOrigenFinanciamiento() {
        return origenFinanciamiento;
    }

    public void setOrigenFinanciamiento(OrigenFinanciamiento origenFinanciamiento) {
        this.origenFinanciamiento = origenFinanciamiento;
    }


    public List<Plan_Criterio> getPlanCriterioList() {
        return planCriterioList;
    }

    public void setPlanCriterioList(List<Plan_Criterio> planCriterioList) {
        this.planCriterioList = planCriterioList;
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

    @Override
    public int getId() {
        return id_Plan;
    }
}
