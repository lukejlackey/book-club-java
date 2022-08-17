package com.lukejlackey.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.lukejlackey.bookclub.models.Book;
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
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null) {
			model.addAttribute("user", new User());
			model.addAttribute("loginUser", new LoginUser());
			return "loginReg.jsp";
		}
		return "redirect:/dashboard";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) {
		User newUser = userService.registerUser(user, result);
		if (result.hasErrors() || newUser == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "loginReg.jsp";
		}
		session.setAttribute("loggedUserId", newUser.getId());
		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,
			HttpSession session) {
		User loggedUser = userService.login(loginUser, result);
		if (result.hasErrors() || loggedUser == null) {
			model.addAttribute("user", new User());
			return "loginReg.jsp";
		}
		session.setAttribute("loggedUserId", loggedUser.getId());
		return "redirect:/dashboard";
	}

	@GetMapping("/dashboard")
	public String showDash(Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		model.addAttribute("loggedUser", userService.findById((Long) session.getAttribute("loggedUserId")));
		model.addAttribute("books", bookService.findAll());
		return "dash.jsp";
	}

	@GetMapping("/books/new")
	public String showNew(Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		model.addAttribute("loggedUser", userService.findById((Long) session.getAttribute("loggedUserId")));
		model.addAttribute("book", new Book());
		return "newBook.jsp";
	}

	@PostMapping("/books/new")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model,
			HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		if (result.hasErrors()) {
			model.addAttribute("loggedUser", userService.findById((Long) session.getAttribute("loggedUserId")));
			return "newBook.jsp";
		}
		book.setUser(userService.findById((Long) session.getAttribute("loggedUserId")));
		bookService.createBook(book);
		return "redirect:/dashboard";
	}

	@GetMapping("/books/{id}")
	public String viewBook(@PathVariable Long id, Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		Book book = bookService.findById(id);
		User user = userService.findById((Long) session.getAttribute("loggedUserId"));
		if (book.getUser().equals(user))
			model.addAttribute("myBook", true);
		model.addAttribute("loggedUser", user);
		model.addAttribute("book", book);
		return "showBook.jsp";
	}

	@GetMapping("books/edit/{id}")
	public String showEdit(@PathVariable Long id, Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		Book book = bookService.findById(id);
		User user = userService.findById((Long) session.getAttribute("loggedUserId"));
		if (!book.getUser().equals(user))
			return "redirect:/dashboard";
		model.addAttribute("loggedUser", user);
		model.addAttribute("book", book);
		return "editBook.jsp";
	}

	@PutMapping("books/edit/{id}")
	public String editBook(@Valid @ModelAttribute("book") Book updatedBook, BindingResult result, @PathVariable Long id,
			Model model, HttpSession session) {
		if (session.getAttribute("loggedUserId") == null)
			return "redirect:/";
		Book book = bookService.findById(id);
		User user = userService.findById((Long) session.getAttribute("loggedUserId"));
		if(result.hasErrors()) {
			model.addAttribute("loggedUser", user);
			return "editBook.jsp";
		}
		if (!book.getUser().equals(user))
			return "redirect:/dashboard";
		updatedBook.setUser(user);
		bookService.createBook(updatedBook);
		return "redirect:/dashboard";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
