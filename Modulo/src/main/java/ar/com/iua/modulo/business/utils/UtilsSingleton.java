package ar.com.iua.modulo.business.utils;

import ar.com.iua.modulo.business.services.impl.FamiliaService;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Plan_RangoEdad;

import java.rmi.server.UID;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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

    public boolean verificarFamilia(Familia familia,List<Persona> integrantes){
        boolean valido = true;
        if (!(integrantes.size() > 0)) {
            valido = false;
        }
        if(this.getJefeFamilia(integrantes) == null) {
            valido = false;
        }
        familia.setActive(valido);
        if (familia.getFechaAlta() == null){
            familia.setFechaAlta(new Date());
            valido = false;
        }
        if (familia.getCodigoDeAlta() == null) {
            familia.setCodigoDeAlta(new UID().toString());
            valido = false;
        }
        return valido;
    }

    public boolean isBetween(int bottom, int top, int x) {
        return top > bottom ? x > bottom && x < top : x > top && x < bottom;
    }

    public int getEdad(Persona persona) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(persona.getFechaNacimiento());
        int anoNacimiento = calendar.get(Calendar.YEAR);
        calendar.setTime(new Date());
        int anoActual = calendar.get(Calendar.YEAR);
        return anoActual - anoNacimiento;
    }

    public int getAño(Date fecha) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(new Date());
        return calendar.get(Calendar.YEAR);
    }

}
