package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorMayores65 extends OperadorAbstracto{

    private boolean existeMayor = false;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        existeMayor = false;
        for (Persona integrante : resultados.obtenerIntegrantes()) {
            if (UtilsSingleton.getInstance().getEdad(integrante) > 65) {
                existeMayor = true;
            }
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (existeMayor) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return existeMayor;
    }
}
