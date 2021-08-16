package com.fxxking.loa.controller.main;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static final String USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36";

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		//getdata();
		showdate(model,locale);
		return "home";
	}
	@GetMapping("/main")
	public String gomain(Model model, Locale locale) {
		showdate(model,locale);
		return "main/mainpage";
	}
	public void showdate(Model model, Locale locale) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
	}
	public void getdata() {
		String uri  = "https://logcs.81plug.com/game";
		Connection conn = Jsoup.connect(uri).header("Content-Type", "application/json;charset=utf-8")
				.userAgent(USER_AGENT)
				.method(Connection.Method.POST)
				.referrer("http://www.google.com")
				.timeout(1000*5)
				.ignoreContentType(true)
				.ignoreHttpErrors(true);
		try {
			Document doc = conn.post();
			System.out.println(doc.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
