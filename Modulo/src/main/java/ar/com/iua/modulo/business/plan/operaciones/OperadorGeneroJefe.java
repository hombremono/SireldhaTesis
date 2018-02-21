package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 18/02/18.
 */
public class OperadorGeneroJefe extends OperadorAbstracto {

    private Persona jefe;

    @Override
    void cargarOperador(PlanResultado resultado, Plan_Criterio criterio, IPlanService planService) {
        this.jefe  = UtilsSingleton.getInstance().getJefeFamilia(resultado.obtenerIntegrantes());
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (criterio.getConstante().getId_Constante() == this.jefe.getSexo().getConstante().getId_Constante()) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return criterio.getConstante().getId_Constante() == this.jefe.getSexo().getConstante().getId_Constante();
    }
}