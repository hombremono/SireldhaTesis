package ar.com.iua.web.spring.services.Controllers;
import ar.com.iua.web.spring.services.ConstantesURL;

import ar.com.iua.modulo.model.Direccion;
import ar.com.iua.modulo.model.Telefono;
import ar.com.iua.modulo.business.services.Interfaces.IDireccionService;
import ar.com.iua.modulo.business.services.Interfaces.ITelefonoService;
import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by mnicolas on 04/06/17.
 */
@RestController
@RequestMapping(value = ConstantesURL.URL_DIRTEL)
public class DireccionTelefonoController extends GenericController {


    @Autowired
    private IDireccionService dirService;
    @Autowired
    private ITelefonoService  telService;

    //----------DIRECCION----------
    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/direccion/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadDir (@PathVariable int id) throws IOException {
        return load(id,dirService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/direccion/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteDir (@PathVariable int id) throws IOException {
        return delete(id,dirService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/direccion", method = RequestMethod.POST)
    public ResponseEntity<Object> addDir (@RequestBody Direccion direccion) throws IOException {
        return add(direccion,dirService, ConstantesURL.URL_DIRTEL);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/direccion", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateDir (@RequestBody Direccion direccion) throws IOException {
        return update(direccion,dirService);
    }


    //----------TELEFONO-----------

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/telefono/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> loadTel (@PathVariable int id) throws IOException {
        return load(id,telService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/telefono/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteTel (@PathVariable int id) throws IOException {
        return delete(id,telService);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/telefono", method = RequestMethod.POST)
    public ResponseEntity<Object> addTel (@RequestBody Telefono telefono) throws IOException {
        return add(telefono,telService, ConstantesURL.URL_DIRTEL);
    }

    @PreAuthorize("hasAuthority('ROLE_ENTRY') or hasAuthority('ROLE_ADMIN')")
    @RequestMapping(value = "/telefono", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateTel (@RequestBody Telefono telefono) throws IOException {
        return update(telefono,telService);
    }


}
