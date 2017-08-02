package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.model.Localidad;
import ar.com.iua.modulo.model.SituacionInmueble;
import ar.com.iua.modulo.model.SolucionHabitacional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by mnicolas on 01/08/17.
 */
public class HogarCombos implements Serializable {

    private static final long serialVersionUID = -1262275932413466908L;

    private List<SolucionHabitacional> solucionesHabitacionales;
    private List<SituacionInmueble> situacionesInmuebles;
    private List<Localidad> localidades;

    public List<SolucionHabitacional> getSolucionesHabitacionales() {
        return solucionesHabitacionales;
    }

    public void setSolucionesHabitacionales(List<SolucionHabitacional> solucionesHabitacionales) {
        this.solucionesHabitacionales = solucionesHabitacionales;
    }

    public List<SituacionInmueble> getSituacionesInmuebles() {
        return situacionesInmuebles;
    }

    public void setSituacionesInmuebles(List<SituacionInmueble> situacionesInmuebles) {
        this.situacionesInmuebles = situacionesInmuebles;
    }

    public List<Localidad> getLocalidades() {
        return localidades;
    }

    public void setLocalidades(List<Localidad> localidades) {
        this.localidades = localidades;
    }

    public HogarCombos (List<SolucionHabitacional> solucionesHabitacionales,
                        List<SituacionInmueble> situacionesInmuebles,
                        List<Localidad> localidades){
        this.solucionesHabitacionales = solucionesHabitacionales;
        this.situacionesInmuebles = situacionesInmuebles;
        this.localidades = localidades;
    }
}
