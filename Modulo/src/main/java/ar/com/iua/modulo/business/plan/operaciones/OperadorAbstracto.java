package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by mnicolas on 17/02/18.
 */
public abstract class OperadorAbstracto implements IOperadorPlan {

    @Override
    public List<PlanResultado> ejecutar(Plan_Criterio criterio, List<PlanResultado> resultados) {
        List<PlanResultado> nuevosResultados = new ArrayList<PlanResultado>();
        for (PlanResultado resultado: resultados) {
            if (procesarRequerido(resultado, criterio)){
                nuevosResultados.add(this.operar(resultado, criterio));
            }
        }
        return nuevosResultados;
    }

    abstract PlanResultado  operar (PlanResultado resultado, Plan_Criterio criterio);

    abstract boolean verificarRequerido (PlanResultado resultado, Plan_Criterio criterio);

    private boolean procesarRequerido(PlanResultado resultado, Plan_Criterio criterio){
        if (criterio.isRequerido()) return verificarRequerido(resultado, criterio);
        return true;
    }
}
