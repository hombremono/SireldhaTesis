package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.model.CapacidadConstructiva;
import ar.com.iua.modulo.model.ConstantePlan;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.TipoCapacidadConstructiva;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorCapacidadConstructiva extends OperadorAbstractoJefe {

    List<ConstantePlan> capacidadesJefe;

    @Override
    void cargarOperador(PlanResultado resultado, Plan_Criterio criterio, IPlanService planService) {
        super.cargarOperador(resultado, criterio, planService);
        capacidadesJefe = new ArrayList<ConstantePlan>();
        for(CapacidadConstructiva capacidad : this.jefe.getCapacidadesConstructivas()) {
            capacidadesJefe.add(capacidad.getTipoCapacidadConstructiva().getConstante());
        }
    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (verificarCapacidad(criterio)) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return verificarCapacidad(criterio);
    }

    private boolean verificarCapacidad (Plan_Criterio criterio) {
        for(ConstantePlan capacidad : capacidadesJefe) {
            if (capacidad.getId_Constante() == criterio.getConstante().getId_Constante()) {
                return true;
            }
        }
        return false;
    }
}
