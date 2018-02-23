package ar.com.iua.modulo.business.plan.operaciones;

import ar.com.iua.modulo.business.model.PlanResultado;
import ar.com.iua.modulo.business.services.Interfaces.IPlanService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.InstalacionInmueble;
import ar.com.iua.modulo.model.Plan_Criterio;

/**
 * Created by mnicolas on 22/02/18.
 */
public class OperadorConservacionInmueble extends OperadorAbstracto {

    private InstalacionInmueble estadoInmueble;
    private boolean existeInmueble;

    @Override
    void cargarOperador(PlanResultado resultados, Plan_Criterio criterio, IPlanService planService) {
        try {
            Inmueble inmueble = planService.getInmuebleByFamilia(resultados.obtenerFamilia().getId_Familia());
            this.existeInmueble = false;
            this.estadoInmueble = new InstalacionInmueble();
            int estadoAgua = 0;
            int estadoGas = 0;
            int estadoCloacal = 0;
            int estadoElectrica = 0;
            int estadoGeneral = 0;
            if (inmueble != null) {
                if (inmueble.getInstalacionAgua() != null){
                    estadoAgua = inmueble.getInstalacionAgua().getSeveridad();
                }
                if (inmueble.getInstalacionGas() != null){
                    estadoGas = inmueble.getInstalacionGas().getSeveridad();
                }
                if (inmueble.getInstalacionCloacal() != null){
                    estadoCloacal = inmueble.getInstalacionCloacal().getSeveridad();
                }
                if (inmueble.getInstalacionElectrica() != null){
                    estadoElectrica = inmueble.getInstalacionElectrica().getSeveridad();
                }
                estadoGeneral = Math.round((estadoAgua + estadoCloacal + estadoElectrica + estadoGas) / 4);
                this.estadoInmueble = planService.getInstalacionBySeveridad(estadoGeneral);
                this.existeInmueble = true;
            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }


    }

    @Override
    PlanResultado operar(PlanResultado resultado, Plan_Criterio criterio) {
        if (this.existeInmueble &&
                this.estadoInmueble.getConstante().getId_Constante() == criterio.getConstante().getId_Constante()) {
            resultado.addPuntaje(criterio.getPuntaje());
        }
        return resultado;
    }

    @Override
    boolean verificarRequerido(PlanResultado resultado, Plan_Criterio criterio) {
        return (this.existeInmueble &&
                this.estadoInmueble.getConstante().getId_Constante() == criterio.getConstante().getId_Constante());
    }
}
