package ar.com.iua.web.spring.services.Controllers;

import ar.com.iua.modulo.business.services.Interfaces.IDireccionService;
import ar.com.iua.modulo.business.services.Interfaces.IPersonaService;
import ar.com.iua.modulo.business.services.Interfaces.ITelefonoService;
import ar.com.iua.modulo.business.utils.exception.ServiceException;
import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.Persona;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.Familia;
import ar.com.iua.modulo.business.services.Interfaces.IFamiliaService;
import ar.com.iua.web.spring.services.ConstantesURL;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.rmi.server.UID;
import java.util.Date;
import java.util.List;

/**
 * Created by mnicolas on 14/06/17.
 */

@RestController
@RequestMapping(value = ConstantesURL.URL_FAMILIA)
public class FamiliaController extends GenericController {

    @Autowired
    private IFamiliaService familiaService;
    @Autowired
    private IDireccionService dirService;
    @Autowired
    private ITelefonoService telService;
    @Autowired
    private IPersonaService personaService;


    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable int id) throws IOException {
        try {
            Familia target = familiaService.load(id);
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

    @RequestMapping(value = "/codigo/{codigoAlta}", method = RequestMethod.GET)
    public ResponseEntity<Object> load (@PathVariable String codigoAlta) throws IOException {
        try {
            Familia target = familiaService.getFamiliaByCodigo(codigoAlta);
            if(target != null &&  target.isActive()){
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
    public ResponseEntity<Object> add (@RequestBody Familia familia) throws IOException {
        Telefono telefono = familia.getTelefono();
        Direccion direccion = familia.getDireccion();

        try {
            if(telefono != null && telefono.getId_Telefono() <= 0 && telefono.getNumero() != null) {
                telefono.setActive(true);
                familia.setTelefono(telService.saveOrUpdate(telefono));
            } else {
                familia.setTelefono(null);
            }
            if(direccion != null && direccion.getId_Direccion() <= 0) {
                direccion.setisActive(true);
                familia.setDireccion(dirService.saveOrUpdate(direccion));
            } else {
                familia.setDireccion(null);
            }

        }catch (Exception e) {
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        familia.setCodigoDeAlta(new UID().toString());
        familia.setFechaAlta(new Date());
        return add(familia,familiaService, ConstantesURL.URL_FAMILIA);

    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public ResponseEntity<Object> update (@RequestBody Familia familia) throws IOException {
        Telefono telefono = familia.getTelefono();
        Direccion direccion = familia.getDireccion();

        try {
            if(telefono != null && telefono.getId_Telefono() <= 0 && telefono.getNumero() != null) {
                telefono.setActive(true);
                familia.setTelefono(telService.saveOrUpdate(telefono));
            }
            if(direccion != null && direccion.getId_Direccion() <= 0) {
                direccion.setisActive(true);
                familia.setDireccion(dirService.saveOrUpdate(direccion));
            }

        }catch (Exception e) {
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return update(familia,familiaService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> delete(@PathVariable int id) throws IOException {
        return setInactive(id,familiaService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/integrantes/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> getIntegrantes (@PathVariable int id) throws IOException {
        try {
            List<Persona> integrantes = familiaService.getIntegrantes(id);
            if(!integrantes.isEmpty()){
                return new ResponseEntity<Object>(integrantes , HttpStatus.OK);
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
    @RequestMapping(value = "/integrantesByDni/{dni}", method = RequestMethod.GET)
    public ResponseEntity<Object> getIntegrantes (@PathVariable String dni) throws IOException {
        try {
            List<Persona> listaJefes = personaService.getByDni(dni);
            if(!listaJefes.isEmpty()){
                List<Persona> integrantes = familiaService.getIntegrantes(listaJefes.get(0).getFamilia().getId_Familia());
                if(!integrantes.isEmpty()){
                    return new ResponseEntity<Object>(integrantes , HttpStatus.OK);
                }
            }
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/setDocumentacion/{idFamilia}/{check}", method = RequestMethod.GET)
    public ResponseEntity<Object> setDocumentacion (@PathVariable("idFamilia") int idFamilia, @PathVariable("check") boolean check) throws IOException {
        try {
            Familia familia = familiaService.load(idFamilia);
            familia.setDocumentacionCompleta(check);
            return update(familia,familiaService);
        } catch (ServiceException e) {
            e.printStackTrace();
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (NotFoundException e) {
            e.printStackTrace();
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        }


    }

}