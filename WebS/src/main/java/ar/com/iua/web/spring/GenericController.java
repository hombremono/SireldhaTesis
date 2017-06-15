package ar.com.iua.web.spring;

import ar.com.iua.modulo.business.IGenericService;
import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.model.IModel;
import ar.com.iua.web.spring.services.SimpleResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.net.URI;

/**
 * Created by mnicolas on 06/06/17.
 */




public abstract class GenericController {

    private static Logger LOG = LoggerFactory.getLogger(GenericController.class);

    protected ResponseEntity<Object> load (int id, IGenericService objService) throws IOException {

        try {
            return new ResponseEntity<Object>(objService.load(id), HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    protected ResponseEntity<Object> delete (int id, IGenericService objService) throws IOException {
        try {
            objService.delete(objService.load(id));
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (NotFoundException nfe) {
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    protected ResponseEntity<Object> add (IModel model, IGenericService objService,String URL) throws IOException {
        try {
            objService.save(model);
            HttpHeaders headers = new HttpHeaders();
            headers.setLocation(new URI(URL + "/" + model.getId()));
            return new ResponseEntity<Object>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    protected ResponseEntity<Object> update (IModel model, IGenericService objService) throws IOException {
        try {
            objService.update(model);
            HttpHeaders headers = new HttpHeaders();
            return new ResponseEntity<Object>(headers, HttpStatus.OK);
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
