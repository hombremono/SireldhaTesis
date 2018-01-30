package ar.com.iua.web.spring.services;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = ConstantesURL.URL_CORE)
public class CoreRSController  {
	@RequestMapping(value = "/pingAuth", method = RequestMethod.GET)
	public ResponseEntity<String> getIdCaApy() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails user = (UserDetails) auth.getPrincipal();
		return new ResponseEntity<String>("{\"code\":0,\"username\": \"" + user.getUsername() + "\"}",
				HttpStatus.OK);

	}

}