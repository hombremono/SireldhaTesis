package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 18/02/18.
 */
public class OperadorSituacionLaboral extends OperadorAbstractoJefe {

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.jefe.getSituacionLaboral().getConstante().getId() == criterio.getConstante().getId()) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.jefe.getSituacionLaboral().getConstante().getId() == criterio.getConstante().getId();
    }
}
