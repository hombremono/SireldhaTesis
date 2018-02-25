package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 25/02/18.
 */
public class OperadorInicioVigencia extends OperadorAbstracto {

    private String operacionLogica = "";
    private boolean match;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        operacionLogica = criterio.getConstante().getConstanteOperador().getConstante();
        switch (operacionLogica) {
            case "INICIO_VIGENCIA":
                break;
            case "CANTIDAD_INTEGRANTES":
                break;
            case "INGRESOS":
                break;
        }

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
