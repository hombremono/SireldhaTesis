package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.model.*;

import java.io.Serializable;
import java.util.List;

/**
 * Created by mnicolas on 14/01/18.
 */
public class PlanCombos implements Serializable {
    private static final long serialVersionUID = -1262275932413466908L;

    private List<Plan_SituacionRegistro> planSituacionRegistroList;
    private List<Plan_SituacionHogar> planSituacionHogarList;
    private List<Localidad> localidadList;
    private List<Plan_RangoEdad> planRangoEdadList;
    private List<Sexo> sexoList;
    private List<Nacionalidad> nacionalidadList;
    private List<EstadoCivil> estadoCivilList;
    private List<SituacionLaboral> situacionLaboralList;
    private List<TipoCapacidadConstructiva> capacidadConstructivaList;
    private List<Plan_CaracteristicasHogar> planCaracteristicasHogarList;
    private List<PoseeInmueble> poseeInmuebleList;
    private List<SituacionInmueble> situacionInmuebleList;
    private List<Plan_Calmat> planCalmatList;
    private List<InstalacionInmueble> instalacionInmuebleList;
    private List<Plan_SituacionHabitacional> planSituacionHabitacionalList;
    private List<OrigenFinanciamiento> origenFinanciamientoList;


    public PlanCombos(List<Plan_SituacionRegistro> planSituacionRegistroList,
                      List<Plan_SituacionHogar> planSituacionHogarList, List<Localidad> localidadList,
                      List<Plan_RangoEdad> planRangoEdadList, List<Sexo> sexoList, List<Nacionalidad> nacionalidadList,
                      List<EstadoCivil> estadoCivilList, List<SituacionLaboral> situacionLaboralList,
                      List<TipoCapacidadConstructiva> capacidadConstructivaList,
                      List<Plan_CaracteristicasHogar> planCaracteristicasHogarList,
                      List<PoseeInmueble> poseeInmuebleList, List<SituacionInmueble> situacionInmuebleList,
                      List<Plan_Calmat> planCalmatList, List<InstalacionInmueble> instalacionInmuebleList,
                      List<Plan_SituacionHabitacional> planSituacionHabitacionalList,
                      List<OrigenFinanciamiento> origenFinanciamientoList) {
        this.planSituacionRegistroList = planSituacionRegistroList;
        this.planSituacionHogarList = planSituacionHogarList;
        this.localidadList = localidadList;
        this.planRangoEdadList = planRangoEdadList;
        this.sexoList = sexoList;
        this.nacionalidadList = nacionalidadList;
        this.estadoCivilList = estadoCivilList;
        this.situacionLaboralList = situacionLaboralList;
        this.capacidadConstructivaList = capacidadConstructivaList;
        this.planCaracteristicasHogarList = planCaracteristicasHogarList;
        this.poseeInmuebleList = poseeInmuebleList;
        this.situacionInmuebleList = situacionInmuebleList;
        this.planCalmatList = planCalmatList;
        this.instalacionInmuebleList = instalacionInmuebleList;
        this.planSituacionHabitacionalList = planSituacionHabitacionalList;
        this.origenFinanciamientoList = origenFinanciamientoList;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public List<Plan_SituacionRegistro> getPlanSituacionRegistroList() {
        return planSituacionRegistroList;
    }

    public void setPlanSituacionRegistroList(List<Plan_SituacionRegistro> planSituacionRegistroList) {
        this.planSituacionRegistroList = planSituacionRegistroList;
    }

    public List<Plan_SituacionHogar> getPlanSituacionHogarList() {
        return planSituacionHogarList;
    }

    public void setPlanSituacionHogarList(List<Plan_SituacionHogar> planSituacionHogarList) {
        this.planSituacionHogarList = planSituacionHogarList;
    }

    public List<Localidad> getLocalidadList() {
        return localidadList;
    }

    public void setLocalidadList(List<Localidad> localidadList) {
        this.localidadList = localidadList;
    }

    public List<Plan_RangoEdad> getPlanRangoEdadList() {
        return planRangoEdadList;
    }

    public void setPlanRangoEdadList(List<Plan_RangoEdad> planRangoEdadList) {
        this.planRangoEdadList = planRangoEdadList;
    }

    public List<Sexo> getSexoList() {
        return sexoList;
    }

    public void setSexoList(List<Sexo> sexoList) {
        this.sexoList = sexoList;
    }

    public List<Nacionalidad> getNacionalidadList() {
        return nacionalidadList;
    }

    public void setNacionalidadList(List<Nacionalidad> nacionalidadList) {
        this.nacionalidadList = nacionalidadList;
    }

    public List<EstadoCivil> getEstadoCivilList() {
        return estadoCivilList;
    }

    public void setEstadoCivilList(List<EstadoCivil> estadoCivilList) {
        this.estadoCivilList = estadoCivilList;
    }

    public List<SituacionLaboral> getSituacionLaboralList() {
        return situacionLaboralList;
    }

    public void setSituacionLaboralList(List<SituacionLaboral> situacionLaboralList) {
        this.situacionLaboralList = situacionLaboralList;
    }

    public List<TipoCapacidadConstructiva> getCapacidadConstructivaList() {
        return capacidadConstructivaList;
    }

    public void setCapacidadConstructivaList(List<TipoCapacidadConstructiva> capacidadConstructivaList) {
        this.capacidadConstructivaList = capacidadConstructivaList;
    }

    public List<Plan_CaracteristicasHogar> getPlanCaracteristicasHogarList() {
        return planCaracteristicasHogarList;
    }

    public void setPlanCaracteristicasHogarList(List<Plan_CaracteristicasHogar> planCaracteristicasHogarList) {
        this.planCaracteristicasHogarList = planCaracteristicasHogarList;
    }

    public List<PoseeInmueble> getPoseeInmuebleList() {
        return poseeInmuebleList;
    }

    public void setPoseeInmuebleList(List<PoseeInmueble> poseeInmuebleList) {
        this.poseeInmuebleList = poseeInmuebleList;
    }

    public List<SituacionInmueble> getSituacionInmuebleList() {
        return situacionInmuebleList;
    }

    public void setSituacionInmuebleList(List<SituacionInmueble> situacionInmuebleList) {
        this.situacionInmuebleList = situacionInmuebleList;
    }

    public List<Plan_Calmat> getPlanCalmatList() {
        return planCalmatList;
    }

    public void setPlanCalmatList(List<Plan_Calmat> planCalmatList) {
        this.planCalmatList = planCalmatList;
    }

    public List<InstalacionInmueble> getInstalacionInmuebleList() {
        return instalacionInmuebleList;
    }

    public void setInstalacionInmuebleList(List<InstalacionInmueble> instalacionInmuebleList) {
        this.instalacionInmuebleList = instalacionInmuebleList;
    }

    public List<Plan_SituacionHabitacional> getPlanSituacionHabitacionalList() {
        return planSituacionHabitacionalList;
    }

    public void setPlanSituacionHabitacionalList(List<Plan_SituacionHabitacional> planSituacionHabitacionalList) {
        this.planSituacionHabitacionalList = planSituacionHabitacionalList;
    }

    public List<OrigenFinanciamiento> getOrigenFinanciamientoList() {
        return origenFinanciamientoList;
    }

    public void setOrigenFinanciamientoList(List<OrigenFinanciamiento> origenFinanciamientoList) {
        this.origenFinanciamientoList = origenFinanciamientoList;
    }
}
