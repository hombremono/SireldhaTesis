package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorCatastrofe extends OperadorAbstracto {

    private boolean careceVivienda;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        this.careceVivienda = false;
        try {
            this.careceVivienda = planService.getCarecimiento(resultados.obtenerFamilia().getId_Familia()) != null;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.careceVivienda) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.careceVivienda;
    }
}
