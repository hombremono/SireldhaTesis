package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan;

import java.util.List;

/**
 * Created by mnicolas on 17/02/18.
 */
public class PlanResultado {

    private Familia familia;

    private List<Persona> integrantes;

    private Plan plan;

    private float puntaje;

    private String nombreJefe;

    public PlanResultado(Familia familia, List<Persona> integrantes, Plan plan) {
        this.familia = familia;
        this.integrantes = integrantes;
        this.plan = plan;
        this.puntaje = 0;
        for (Persona integrante : integrantes){
            if (integrante.getRolFamiliar().getId_RolFamiliar() == 1) {
                this.nombreJefe = integrante.getApellido() + " " + integrante.getNombre();
            }
        }


    }

    public Familia obtenerFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public Plan obtenerPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public float getPuntaje() {
        return puntaje;
    }

    public String getNombrePlan() { return plan.getNombre(); }

    public void addPuntaje(float puntaje) {
        this.puntaje += puntaje;
    }

    public List<Persona> obtenerIntegrantes() {
        return integrantes;
    }

    public String getNombreJefe() {
        return nombreJefe;
    }

    public void setNombreJefe(String nombreJefe) {
        this.nombreJefe = nombreJefe;
    }
}
