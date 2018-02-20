package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 20/02/18.
 */
public class OperadorAdjudicatarioEstatal extends OperadorAbstractoJefe {

    private boolean adjudicatario;


    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        super.cargarOperador(resultados, criterio, planService);
        adjudicatario = this.jefe.isAdjudicatarioPlanEstatal();
    }


    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (adjudicatario) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return adjudicatario;
    }
}
