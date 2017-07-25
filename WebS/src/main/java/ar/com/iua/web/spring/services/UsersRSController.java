package ar.com.iua.web.spring.services;

import java.io.IOException;
import java.net.URI;

import ar.com.iua.web.spring.services.Controllers.Generic.GenericController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.User;
import ar.com.iua.modulo.business.Interfaces.IUserService;

@RestController

@RequestMapping(value = Constantes.URL_USERS)
public class UsersRSController extends GenericController{
	private static Logger LOG = LoggerFactory.getLogger(UsersRSController.class);

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ResponseEntity<Object> list() throws IOException {
		try {
			return new ResponseEntity<Object>(userService.list(), HttpStatus.OK);
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);

			return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Object> load(@PathVariable int id) throws IOException {
		return load(id,userService);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Object> delete(@PathVariable int id) throws IOException {
		return delete(id,userService);
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Object> add(@RequestBody User user) throws IOException {
		return add(user,userService,Constantes.URL_USERS);
	}

	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public ResponseEntity<Object> update(@RequestBody User user) throws IOException {
		return update(user,userService);
	}

}
