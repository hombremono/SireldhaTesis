package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 21/02/18.
 */
public class OperadorSituacionInmueble extends OperadorAbstracto {

    private boolean coincidencia;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        coincidencia = false;
        coincidencia = (resultados.obtenerFamilia().getSituacionInmueble().getConstante().getId_Constante()
                == criterio.getConstante().getId_Constante());
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (coincidencia) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return coincidencia;
    }
}
