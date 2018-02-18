package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 17/02/18.
 */
public class OperadorDocumentacionCompleta extends OperadorAbstracto {

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (resultado.obtenerFamilia().isDocumentacionCompleta()) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return resultado.obtenerFamilia().isDocumentacionCompleta();
    }

}
