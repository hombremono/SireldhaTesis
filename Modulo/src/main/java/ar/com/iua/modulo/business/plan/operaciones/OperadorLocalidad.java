package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.model.Plan_Criterio;
import com.sun.org.apache.bcel.internal.generic.RETURN;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorLocalidad extends OperadorAbstractoJefe {
    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.jefe.getLocalidad().getConstante().getId_Constante() == criterio.getConstante().getId_Constante()) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.jefe.getLocalidad().getConstante().getId_Constante() == criterio.getConstante().getId_Constante();
    }
}
