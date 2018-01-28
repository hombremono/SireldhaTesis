package ar.com.iua.modulo.business.Interfaces;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.impl.GenericService;
import ar.com.iua.modulo.business.model.PlanCombos;
import ar.com.iua.modulo.model.Plan;
import ar.com.iua.modulo.model.Plan_Calmat;
import ar.com.iua.modulo.model.persistence.dao.IPlanSituacionRegistroDAO;
import ar.com.iua.modulo.model.persistence.dao.hibernate.PlanSituacionRegistroDAO;

/**
 * Created by mnicolas on 16/01/18.
 */
public interface IPlanService extends IGenericService<Plan, Integer> {

    public PlanCombos getCombos() throws ServiceException;

}
