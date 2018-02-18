package ar.com.iua.modulo.business.utils;

import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Persona;

import java.util.List;

/**
 * Created by mnicolas on 18/02/18.
 */
public class UtilsSingleton {

    private static UtilsSingleton instancia;

    protected UtilsSingleton() {
        // Exists only to defeat instantiation.
    }
    public static UtilsSingleton getInstance() {
        if(instancia == null) {
            instancia = new UtilsSingleton();
        }
        return instancia;
    }

    public Persona getJefeFamilia (List<Persona> integrantes){
        for (Persona integrante : integrantes){
            if (integrante.getRolFamiliar().getId_RolFamiliar() == 1) {
                return integrante;
            }
        }
        return null;
    }
}
