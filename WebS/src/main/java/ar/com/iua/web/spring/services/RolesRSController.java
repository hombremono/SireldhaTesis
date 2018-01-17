package ar.com.iua.web.spring.services;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ar.com.iua.modulo.business.Interfaces.IRoleService;

@RestController

@RequestMapping(value = Constantes.URL_ROLES)
public class RolesRSController {
	private static Logger LOG = LoggerFactory.getLogger(RolesRSController.class);

	@Autowired
	private IRoleService roleService;

	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ResponseEntity<Object> list() throws IOException {
		try {
			return new ResponseEntity<Object>(roleService.list(), HttpStatus.OK);
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);

			return new ResponseEntity<Object>(new SimpleResponse(-1, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
