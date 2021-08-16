package com.fxxking.loa.controller.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fxxking.loa.domian.Users;

@Controller
public class UserController {
	
	@PostMapping("/login")
	public String login(Users user, HttpServletRequest request, Model model) {
		String result = "";
		
		return result;
	}
}
