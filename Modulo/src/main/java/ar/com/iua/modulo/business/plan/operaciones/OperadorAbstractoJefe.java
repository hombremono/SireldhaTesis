package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.Plan_Item;

/**
 * Created by mnicolas on 18/02/18.
 */
abstract class OperadorAbstractoJefe extends OperadorAbstracto{

    protected Persona jefe;

    @Override
    void cargarOperador(PlanResultado resultado, Plan_Criterio criterio, IPlanService planService) {
        this.jefe = UtilsSingleton.getInstance().getJefeFamilia(resultado.obtenerIntegrantes());
    }
}
