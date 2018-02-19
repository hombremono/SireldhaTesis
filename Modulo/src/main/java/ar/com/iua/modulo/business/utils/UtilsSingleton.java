package ar.com.iua.modulo.business.utils;

import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_RangoEdad;

import java.util.List;

/**
 * Created by mnicolas on 18/02/18.
 */
public class UtilsSingleton {

    private static UtilsSingleton instancia;

    //-------- VARIABLES ESPECIFICAS-----------
    private Plan_RangoEdad rangoEdad;

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

    public boolean isBetween(int bottom, int top, int x) {
        return top > bottom ? x > bottom && x < top : x > top && x < bottom;
    }

    public Plan_RangoEdad getRangoEdad() {
        return rangoEdad;
    }

    public void setRangoEdad(Plan_RangoEdad rangoEdad) {
        this.rangoEdad = rangoEdad;
    }
}
