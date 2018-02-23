package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 22/02/18.
 */
public class OperadorCalmat extends OperadorAbstracto {
    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {

    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        return null;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return false;
    }
}
