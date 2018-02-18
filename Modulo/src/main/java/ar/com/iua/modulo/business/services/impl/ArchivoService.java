package ar.com.iua.modulo.business.services.impl;

import ar.com.iua.modulo.model.Archivo;
import ar.com.iua.modulo.business.services.Interfaces.IArchivoService;
import ar.com.iua.modulo.model.persistence.dao.IArchivoDAO;

public class ArchivoService extends GenericService<Archivo, Integer> implements IArchivoService {

	public ArchivoService(IArchivoDAO dao) {
		super(dao);
	}

	private static final long serialVersionUID = -6357567873322505552L;

}
