package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;

import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.services.impl.PlanService;
import ar.com.iua.modulo.business.utils.UtilsSingleton;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Plan_Criterio;
import ar.com.iua.modulo.model.Plan_Item;
import ar.com.iua.modulo.model.Plan_RangoEdad;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by mnicolas on 19/02/18.
 */
public class OperadorEdadJefe extends OperadorAbstractoJefe {

    private int edadJefe;
    private int edadMinima;
    private int edadMaxima;

    @Override
    void cargarOperador(PlanResultado resultado, Plan_Criterio criterio, IPlanService planService) {
        super.cargarOperador(resultado, criterio, planService);
        this.edadJefe = UtilsSingleton.getInstance().getEdad(this.jefe);
        Plan_RangoEdad rango;
        try {
            rango = planService.getRangoEdad(criterio.getConstante().getId_Constante());
            edadMinima = (int)rango.getDesde();
            edadMaxima = (int)rango.getHasta();

        } catch (ServiceException e) {
            e.printStackTrace();//TODO
        }

    }


    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (UtilsSingleton.getInstance().isBetween(edadMinima,edadMaxima,edadJefe)) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return UtilsSingleton.getInstance().isBetween(edadMinima,edadMaxima,edadJefe);
    }
}
