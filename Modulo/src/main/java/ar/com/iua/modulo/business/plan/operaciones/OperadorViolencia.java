package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.SituacionesEspeciales;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorViolencia extends OperadorAbstracto {
    private boolean existeViolencia;


    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        existeViolencia = false;
        for (Persona integrante : resultados.obtenerIntegrantes()) {
            if (integrante.getSituacionesEspeciales() != null && integrante.getSituacionesEspeciales().isVictimaViolencia()) {
                existeViolencia = true;
            }
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (existeViolencia){
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return existeViolencia;
    }


}
