package com.springmvc.sb.services;

import java.util.List;

import com.springmvc.sb.model.Customer;

/**
* Customer Service interface Class
* 
* @author  Bhautik Padmani
* @version 11
* @since   March 2014 
*/
public interface CustomerService {

	// Get all customers service
	List<Customer> getAllCustomers();

	// Customers save service
	void saveCustomer(Customer customer);

	// Get customer by id service
	Customer getCustomerById(int id);

	// Customer delete service
	void deleteCustomer(int id);

	// Check Email service
	boolean findByEmail(String email);

	// Check Mobile number service
	boolean findByMobile(String mobile);

}
