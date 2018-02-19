package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.Plan_Item;

import java.util.List;

/**
 * Created by mnicolas on 04/02/18.
 */
public interface IOperadorPlan {
    public List<PlanResultado> ejecutar(Plan_Criterio criterio, List<PlanResultado> resultados, IPlanService planService);
}
