package ar.com.iua.modulo.model.persistence.dao;

import ar.com.iua.modulo.model.Archivo;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;

public interface IArchivoDAO extends IGenericDAO<Archivo, Integer> {


    /**
     * Created by mnicolas on 08/06/17.
     */
    interface IPersonaDAO extends IGenericDAO<Persona, Integer> {
    }
}
