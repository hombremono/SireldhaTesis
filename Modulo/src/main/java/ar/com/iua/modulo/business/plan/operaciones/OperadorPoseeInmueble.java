package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 20/02/18.
 */
public class OperadorPoseeInmueble extends OperadorAbstracto {

    private boolean poseeInmueble;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        this.poseeInmueble = false;
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(resultados.obtenerFamilia().getId_Familia());
            this.poseeInmueble = inmueble != null;
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.poseeInmueble) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.poseeInmueble;
    }
}
