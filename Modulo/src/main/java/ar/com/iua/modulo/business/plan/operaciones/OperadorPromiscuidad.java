package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 22/02/18.
 */
public class OperadorPromiscuidad extends OperadorAbstracto {

    private boolean promiscuidad;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        this.promiscuidad = false;
        Familia familia = resultados.obtenerFamilia();
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(familia.getId_Familia());
            this.promiscuidad = inmueble != null && (inmueble.getCantidadCamas() < resultados.obtenerIntegrantes().size());
        } catch (ServiceException e) {
            e.printStackTrace();//TODO
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.promiscuidad) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return this.promiscuidad;
    }
}
