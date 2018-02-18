package ar.com.iua.web.spring.services;

import ar.com.iua.modulo.business.plan.operaciones.IOperadorPlan;
import ar.com.iua.modulo.business.plan.operaciones.OperadorGenerico;
import ar.com.iua.modulo.model.ConstantePlan;


/**
 * Created by mnicolas on 29/01/18.
 */

public class PlanOperacionFactory {

    private static PlanOperacionFactory instance = null;

    private IOperadorPlan operadorDefault;


//    private List<ConstantePlan> constantePlanList;
//
//    private List<IOperadorPlan> operacionesClassCache;

    protected PlanOperacionFactory() {
        this.init();
    }

    public static PlanOperacionFactory getInstance() {
        if(instance == null) {
            instance = new PlanOperacionFactory();
        }
        return instance;
    }

    private void init () {
        this.operadorDefault = new OperadorGenerico();
    }

    public IOperadorPlan getOperador (ConstantePlan constante) {
        try {
            if (constante.obtenerClaseOperador() != null) {
                return  (IOperadorPlan) Class.forName("ar.com.iua.modulo.business.plan.operaciones." +
                        constante.obtenerClaseOperador()).newInstance();
            }
        } catch (InstantiationException e) {
            e.printStackTrace();//TODO Reflection exception
        } catch (IllegalAccessException e) {
            e.printStackTrace();//TODO Reflection exception
        } catch (ClassNotFoundException e) {
            e.printStackTrace();//TODO Reflection exception
        }
        return  operadorDefault;
    }
}
