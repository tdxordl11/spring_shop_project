package com.spring.shop_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@RequestMapping(value = "/logintest", method = RequestMethod.GET)
	public String Login() {
		
		return "logintest";
	}
	
	
}
