package com.lukejlackey.bookclub.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lukejlackey.bookclub.models.LoginUser;
import com.lukejlackey.bookclub.models.User;
import com.lukejlackey.bookclub.services.BookService;
import com.lukejlackey.bookclub.services.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("/")
	public String index(Model model, HttpSession session){
		if(session.getAttribute("loggedUser") == null) {
			model.addAttribute("user", new User());
			model.addAttribute("loginUser", new LoginUser());
			return "loginReg.jsp";
		}
		return "redirect:/books";
	}
	
}
