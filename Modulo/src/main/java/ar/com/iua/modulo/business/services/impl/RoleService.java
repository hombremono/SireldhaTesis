package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.model.Role;
import ar.com.iua.modulo.business.services.Interfaces.IRoleService;
import ar.com.iua.modulo.model.persistence.dao.IRoleDAO;

public class RoleService extends GenericService<Role, Integer> implements IRoleService {

	public RoleService(IRoleDAO dao) {
		super(dao);
	}

	private static final long serialVersionUID = -6357567873322505552L;

}
