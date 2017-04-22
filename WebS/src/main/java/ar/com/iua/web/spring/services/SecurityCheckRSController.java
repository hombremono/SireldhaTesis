package ar.com.iua.web.spring.services;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ar.com.iua.web.spring.security.model.UserDetailsAdapter;

@RestController

@RequestMapping(value = Constantes.URL_SECCHECK)
public class SecurityCheckRSController {

	@PreAuthorize("hasAuthority('ADMIN')")
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ResponseEntity<Object> adminOnly() {
		return new ResponseEntity<Object>(new SimpleResponse(0, "usted tiene rol admin!"), HttpStatus.OK);
	}

	@PreAuthorize("hasAuthority('USER')")
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ResponseEntity<Object> userOnly() {
		return new ResponseEntity<Object>(new SimpleResponse(0, "usted tiene rol user!"), HttpStatus.OK);
	}

	@PreAuthorize("hasAuthority('USER') or hasAuthority('ADMIN')")
	@RequestMapping(value = "/user-or-admin", method = RequestMethod.GET)
	public ResponseEntity<Object> userOrAdminOnly() {
		return new ResponseEntity<Object>(new SimpleResponse(0, "usted tiene rol user o admin!"), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/my-info", method = RequestMethod.GET)
	public ResponseEntity<String> mynfo() {
		return new ResponseEntity<String>(getUserPrincipalBasicInfo(), HttpStatus.OK);
	}

	private UserDetailsAdapter getUserPrincipal() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetailsAdapter user = (UserDetailsAdapter) auth.getPrincipal();
		return user;
	}

	private String getUserPrincipalBasicInfo() {
		UserDetailsAdapter u = getUserPrincipal();
		JSONObject r = new JSONObject();
		r.put("idUser", u.getId());
		r.put("firstname", u.getFistName());
		r.put("lastname", u.getLastName());
		r.put("email", u.getEmail());
		r.put("authorities", u.getAuthorities());
		return r.toString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
