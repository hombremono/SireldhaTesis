package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.services.Interfaces.*;
import ar.com.iua.modulo.business.model.InmuebleCombos;
import ar.com.iua.modulo.model.*;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.web.spring.services.ConstantesURL;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 05/07/17.
 */

@RestController
@RequestMapping(value = ConstantesURL.URL_INMUEBLE)
public class InmuebleController extends GenericController {

    @Autowired
    private IInmuebleService inmuebleService;
    @Autowired
    private ISinInmuebleService sinInmuebleService;
    @Autowired
    private ITerrenoService terrenoService;
    @Autowired
    private IAlquilerService alquilerService;
    @Autowired
    private ICareceViviendaService careceViviendaService;
//    @Autowired
//    private ITelefonoService telefonoService;
    @Autowired
    private IDireccionService direccionService;

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException {
        try {
            Inmueble target = inmuebleService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Object> add (@RequestBody Inmueble inmueble) throws IOException {
        return add(inmueble, inmuebleService, ConstantesURL.URL_INMUEBLE);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Inmueble inmueble) throws IOException {
        return update(inmueble, inmuebleService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteTel (@PathVariable int id) throws IOException {
        try {
            Inmueble target = inmuebleService.load(id);
            target.setActive(false);
            inmuebleService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/loadCombos", method = RequestMethod.GET)
    public ResponseEntity<Object> loadCombos () throws IOException {
        try {
            InmuebleCombos target =  inmuebleService.getCombos();
            return new ResponseEntity<Object>(target , HttpStatus.OK);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //-------------------------------------------SIN INMUEBLE-----------------------------------------------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/sinInmueble/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadSinInmueble (@PathVariable int id) throws IOException {
        try {
            SinInmueble target = sinInmuebleService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/sinInmueble/", method = RequestMethod.POST)
    public ResponseEntity<Object> addSinInmueble (@RequestBody SinInmueble sinInmueble) throws IOException {
        return add(sinInmueble, sinInmuebleService, ConstantesURL.URL_INMUEBLE);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/sinInmueble/", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateSinInmueble (@RequestBody Inmueble inmueble) throws IOException {
        return update(inmueble, inmuebleService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/sinInmueble/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteSinInmueble (@PathVariable int id) throws IOException {
        try {
            SinInmueble target = sinInmuebleService.load(id);
            target.setActive(false);
            sinInmuebleService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    //-------------------------------------------TERRENO-----------------------------------------------
    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/terreno/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadTerreno (@PathVariable int id) throws IOException {
        try {
            Terreno target = terrenoService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/terreno/", method = RequestMethod.POST)
    public ResponseEntity<Object> addTerreno (@RequestBody Terreno terreno) throws IOException {
        Direccion direccion = terreno.getDireccion();
        try {
            if(direccion.getId_Direccion() <= 0) {
                direccion.setisActive(true);
                terreno.setDireccion(direccionService.saveOrUpdate(direccion));            }
        }catch (Exception e){
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return add(terreno, terrenoService, ConstantesURL.URL_INMUEBLE);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/terreno/", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateTerreno (@RequestBody Terreno terreno) throws IOException {
        return update(terreno, terrenoService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/terreno/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteTerreno (@PathVariable int id) throws IOException {
        try {
            Terreno target = terrenoService.load(id);
            target.setActive(false);
            terrenoService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //-------------------------------------------ALQUILER-----------------------------------------------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/alquiler/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadAlquiler (@PathVariable int id) throws IOException {
        try {
            Alquiler target = alquilerService.load(id);
            if(target.isActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/alquiler/", method = RequestMethod.POST)
    public ResponseEntity<Object> addAlquiler (@RequestBody Alquiler alquiler) throws IOException {
        return add(alquiler, alquilerService, ConstantesURL.URL_INMUEBLE);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/alquiler/", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateAlquiler(@RequestBody Alquiler alquiler) throws IOException {
        return update(alquiler, alquilerService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/alquiler/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteAlquiler (@PathVariable int id) throws IOException {
        try {
            Alquiler target = alquilerService.load(id);
            target.setActive(false);
            alquilerService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //-------------------------------------------CARECE VIVIENDA-----------------------------------------------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/careceVivienda/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadCareceVivienda (@PathVariable int id) throws IOException {
        try {
            CareceVivienda target = careceViviendaService.load(id);
            if(target.getIsActive()){
                return new ResponseEntity<Object>(target , HttpStatus.OK);
            }else  {
                return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
            }
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/careceVivienda/", method = RequestMethod.POST)
    public ResponseEntity<Object> addCareceVivienda (@RequestBody CareceVivienda careceVivienda) throws IOException {
        return add(careceVivienda, careceViviendaService, ConstantesURL.URL_INMUEBLE);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/careceVivienda/", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateCareceVivienda(@RequestBody CareceVivienda careceVivienda) throws IOException {
        return update(careceVivienda, careceViviendaService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/careceVivienda/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteCareceVivienda (@PathVariable int id) throws IOException {
        try {
            CareceVivienda target = careceViviendaService.load(id);
            target.setIsActive(false);
            careceViviendaService.update(target);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //-------------------------------------------COCINA-----------------------------------------------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/cocina/", method = RequestMethod.POST)
    public ResponseEntity<Object> addCocina (@RequestBody Cocina cocina) throws IOException {
        try {
            Cocina target;
            target = inmuebleService.saveCocina(cocina);
            return new ResponseEntity<Object>(target, HttpStatus.CREATED);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //-------------------------------------------BANO-----------------------------------------------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/bano/", method = RequestMethod.POST)
    public ResponseEntity<Object> addBano (@RequestBody PoseeBano bano) throws IOException {
        try {
            PoseeBano target;
            target = inmuebleService.saveBano(bano);
            return new ResponseEntity<Object>(target, HttpStatus.CREATED);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
