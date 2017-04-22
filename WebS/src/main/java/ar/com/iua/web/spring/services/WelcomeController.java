package ar.com.iua.web.spring.services;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
	    return "redirect:/app/index.html";
	}
}
