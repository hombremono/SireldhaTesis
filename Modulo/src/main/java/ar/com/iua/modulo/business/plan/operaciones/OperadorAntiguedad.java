package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 18/02/18.
 */
public class OperadorAntiguedad extends OperadorAbstracto {

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        float puntaje = resultado.obtenerFamilia().getAntiguedadResidencia() * criterio.getPuntaje();
        resultado.addPuntaje(puntaje);
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return true;
    }
}
