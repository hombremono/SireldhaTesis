package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 25/02/18.
 */
public class OperadorCantidadIntegrantes extends OperadorAbstracto {

    private String operacionLogica = "";
    private boolean match;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        operacionLogica = criterio.getConstanteOperador().getConstante();
        switch (operacionLogica) {
            case "MAYOR":
                this.match = resultados.obtenerIntegrantes().size() > Integer.parseInt(criterio.getValor());
                break;
            case "MENOR":
                this.match = resultados.obtenerIntegrantes().size() < Integer.parseInt(criterio.getValor());
                break;
            case "IGUAL":
                this.match = resultados.obtenerIntegrantes().size() == Integer.parseInt(criterio.getValor());
                break;
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.match) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.match;
    }
}
