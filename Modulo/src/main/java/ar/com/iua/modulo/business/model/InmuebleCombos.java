package ar.com.iua.modulo.business.model;

import ar.com.iua.modulo.model.*;

import java.io.Serializable;
import java.util.List;

/**
 * Created by mnicolas on 16/09/17.
 */
public class InmuebleCombos implements Serializable {
    private static final long serialVersionUID = -1262275932413466908L;
    /**
     motivos carecimiento
     material pared
     material techo
     material piso
     conexiones de agua
     procedencia de agua
     tipo de bano
     tipos luz
     tipos de cocina
     localidades*/
    private List<MotivoCarecimiento> listaMotivoCarecimiento;
    private List<MaterialPared> listaMaterialPared;
    private List<MaterialTecho> listaMaterialTecho;
    private List<MaterialPiso> listaMaterialPiso;
    private List<PoseeAgua> listaPoseeAgua;
    private List<ProcedenciaAgua> listaProcedenciaAgua;
    private List<TipoBano> listaTipoBano;
    private List<PoseeLuz> listaPoseeLuz;
    private List<PoseeCocina> listaPoseeCocina;
    private List<Localidad> listaLocalidad;

    public InmuebleCombos(List<MotivoCarecimiento> listaMotivoCarecimiento, List<MaterialPared> listaMaterialPared,
                          List<MaterialTecho> listaMaterialTecho, List<MaterialPiso> listaMaterialPiso,
                          List<PoseeAgua> listaPoseeAgua, List<ProcedenciaAgua> listaProcedenciaAgua,
                          List<TipoBano> listaTipoBano, List<PoseeLuz> listaPoseeLuz, List<PoseeCocina> listaPoseeCocina,
                          List<Localidad> listaLocalidad) {
        this.listaMotivoCarecimiento = listaMotivoCarecimiento;
        this.listaMaterialPared = listaMaterialPared;
        this.listaMaterialTecho = listaMaterialTecho;
        this.listaMaterialPiso = listaMaterialPiso;
        this.listaPoseeAgua = listaPoseeAgua;
        this.listaProcedenciaAgua = listaProcedenciaAgua;
        this.listaTipoBano = listaTipoBano;
        this.listaPoseeLuz = listaPoseeLuz;
        this.listaPoseeCocina = listaPoseeCocina;
        this.listaLocalidad = listaLocalidad;
    }

    public List<MotivoCarecimiento> getListaMotivoCarecimiento() {
        return listaMotivoCarecimiento;
    }

    public void setListaMotivoCarecimiento(List<MotivoCarecimiento> listaMotivoCarecimiento) {
        this.listaMotivoCarecimiento = listaMotivoCarecimiento;
    }

    public List<MaterialPared> getListaMaterialPared() {
        return listaMaterialPared;
    }

    public void setListaMaterialPared(List<MaterialPared> listaMaterialPared) {
        this.listaMaterialPared = listaMaterialPared;
    }

    public List<MaterialTecho> getListaMaterialTecho() {
        return listaMaterialTecho;
    }

    public void setListaMaterialTecho(List<MaterialTecho> listaMaterialTecho) {
        this.listaMaterialTecho = listaMaterialTecho;
    }

    public List<MaterialPiso> getListaMaterialPiso() {
        return listaMaterialPiso;
    }

    public void setListaMaterialPiso(List<MaterialPiso> listaMaterialPiso) {
        this.listaMaterialPiso = listaMaterialPiso;
    }

    public List<PoseeAgua> getListaPoseeAgua() {
        return listaPoseeAgua;
    }

    public void setListaPoseeAgua(List<PoseeAgua> listaPoseeAgua) {
        this.listaPoseeAgua = listaPoseeAgua;
    }

    public List<ProcedenciaAgua> getListaProcedenciaAgua() {
        return listaProcedenciaAgua;
    }

    public void setListaProcedenciaAgua(List<ProcedenciaAgua> listaProcedenciaAgua) {
        this.listaProcedenciaAgua = listaProcedenciaAgua;
    }

    public List<TipoBano> getListaTipoBano() {
        return listaTipoBano;
    }

    public void setListaTipoBano(List<TipoBano> listaTipoBano) {
        this.listaTipoBano = listaTipoBano;
    }

    public List<PoseeLuz> getListaPoseeLuz() {
        return listaPoseeLuz;
    }

    public void setListaPoseeLuz(List<PoseeLuz> listaPoseeLuz) {
        this.listaPoseeLuz = listaPoseeLuz;
    }

    public List<PoseeCocina> getListaPoseeCocina() {
        return listaPoseeCocina;
    }

    public void setListaPoseeCocina(List<PoseeCocina> listaPoseeCocina) {
        this.listaPoseeCocina = listaPoseeCocina;
    }

    public List<Localidad> getListaLocalidad() {
        return listaLocalidad;
    }

    public void setListaLocalidad(List<Localidad> listaLocalidad) {
        this.listaLocalidad = listaLocalidad;
    }
}
