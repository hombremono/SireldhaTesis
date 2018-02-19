package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorExcombatientes extends OperadorAbstracto {

    private boolean existeExcombatiene;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        this.existeExcombatiene = false;
        for (Persona integrante : resultados.obtenerIntegrantes()) {
            if (integrante.getSituacionesEspeciales() != null && integrante.getSituacionesEspeciales().isExcombatiente()) {
                this.existeExcombatiene = true;
            }
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (existeExcombatiene) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return existeExcombatiene;
    }
}
