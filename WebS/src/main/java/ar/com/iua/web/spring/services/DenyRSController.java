package ar.com.iua.web.spring.services;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DenyRSController {
	@RequestMapping(value = Constantes.URL_DENY, method = RequestMethod.GET)
	public ResponseEntity<String> deny() {
		return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
	}
}
