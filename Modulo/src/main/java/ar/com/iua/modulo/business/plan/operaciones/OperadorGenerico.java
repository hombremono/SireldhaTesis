package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

import java.util.List;

/**
 * Created by mnicolas on 18/02/18.
 */
public class OperadorGenerico implements IOperadorPlan {
    @Override
    public List<PlanResultado> ejecutar(Plan_Criterio criterio, List<PlanResultado> resultados, IPlanService planService) {
        return resultados;
    }
}
