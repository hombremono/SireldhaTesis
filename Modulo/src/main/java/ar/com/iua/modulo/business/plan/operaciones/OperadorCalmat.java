package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Calmat;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 22/02/18.
 */
public class OperadorCalmat extends OperadorAbstracto {

    Calmat calmat;
    boolean coincidencia;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        try {
            coincidencia = false;
            Inmueble inmueble = planService.getInmuebleByFamilia(resultados.obtenerFamilia().getId_Familia());
            if (inmueble != null) {
                calmat = planService.calcularCalmat(inmueble);
                coincidencia = calmat.getConstanteCalmat().getId_Constante() == criterio.getConstante().getId_Constante();
            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }



    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {

        if (coincidencia) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return coincidencia;
    }
}
