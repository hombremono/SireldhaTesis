package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorAsociacionGremio extends OperadorAbstracto {

    private boolean asociacionGremio;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        this.asociacionGremio = false;
        for(Persona integrante : resultados.obtenerIntegrantes()) {
            if (integrante.getSituacionesEspeciales() != null && integrante.getSituacionesEspeciales().isAsociacionGremio()) {
                this.asociacionGremio = true;
            }
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.asociacionGremio) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.asociacionGremio;
    }
}
