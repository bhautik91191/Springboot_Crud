package com.springmvc.sb.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.springmvc.sb.model.Customer;
import com.springmvc.sb.services.CustomerService;

/**
* Mark class as an Controller
* 
* @author  Bhautik Padmani
* @version 11
* @since   March 2014 
*/
@Controller
@RequestMapping(value="/customer")
public class CustomerController {

	private CustomerService service;

	@Autowired
	public CustomerController(CustomerService service) {
		super();
		this.service = service;
	}

	// Get all Customer call customer service class
	@GetMapping("/list")
	public ModelAndView listCustomer() {
		ModelAndView model = new ModelAndView("customer-list");
		List<Customer> customer = service.getAllCustomers();
		model.addObject("customerlist", customer);
		return model;
	}

	// Add new Customer Create ModelAndView object, add object customer and return model
	@GetMapping("/addCustomer/")
	public ModelAndView addCustomer() {
		ModelAndView model = new ModelAndView();
		Customer customer = new Customer();
		model.addObject("customerform", customer);
		model.setViewName("customer-form");
		return model;
	}

	// Save Customer Call CustomerService class and return ModelAndView
	@PostMapping("/save") 
	public ModelAndView add(@ModelAttribute("customerform") Customer customer) {
		service.saveCustomer(customer);
		return new ModelAndView("redirect:/customer/list");
	}

	// Edit Customer Create ModelAndView Object call CustomerService class and return model
	@GetMapping("/editCustomer/{id}")
	public ModelAndView editCustomer(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView();
		Customer customer = service.getCustomerById(id);
		service.saveCustomer(customer);
		model.addObject("customerform", customer);
		model.setViewName("customer-form");
		return model;
	}

	// Delete Customer in database
	@GetMapping("/deleteCustomer/{id}")
	public ModelAndView deleteCustomer(@PathVariable("id") int id) {
		service.deleteCustomer(id);
		return new ModelAndView("redirect:/customer/list");
	}

	// Check email call findByEmail method and return boolean
	@GetMapping("/checkemail")
	@ResponseBody
	public boolean checkEmail(HttpServletRequest req, Model model) {
		String email = req.getParameter("email");
		System.err.println("email: " + email);
		return service.findByEmail(email);
	}

	// Check mobile number call findByMobile method and return boolean
	@GetMapping("/checkmobile")
	@ResponseBody
	public boolean checkMobile(HttpServletRequest req, Model model) {
		String mobile = req.getParameter("mobile");
		System.err.println("mobile: " + mobile);
		return service.findByMobile(mobile);
	}

}
