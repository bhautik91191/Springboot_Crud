package com.springmvc.sb.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springmvc.sb.model.Customer;
import com.springmvc.sb.repository.CustomerRepository;

/**
* Customer Service implement Class
* Implements Customer Service and Override method
* 
* @author  Bhautik Padmani
* @version 11
* @since   March 2014 
*/
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository repository;

	// Get all Customer from Database
	@Override
	public List<Customer> getAllCustomers() {
		return (List<Customer>) repository.findAll();
	}

	// Save Customer in Database
	@Override
	public void saveCustomer(Customer customer) {
		repository.save(customer);
	}

	// Find Customer from Database
	@Override
	public Customer getCustomerById(int id) {
		Optional <Customer> opt = repository.findById(id);
		Customer customer = null;
		if (opt.isPresent()) {
			customer = opt.get();
		} else {
			throw new RuntimeException("Customer not found for id : " + id);
		}
		return customer;
	}

	// Delete Customer in Database
	@Override
	public void deleteCustomer(int id) {
		repository.deleteById(id);
	}

	// Check Email from Database
	@Override
	public boolean findByEmail(String email) {
		Optional<Customer> customer = repository.findByEmail(email);
		System.out.println("******Checked Email******");
		return customer.isPresent();
	}

	// Check Mobile number from Database
	@Override
	public boolean findByMobile(String mobile) {
		Optional<Customer> customer = repository.findByMobile(mobile);
		System.out.println("******Checked Mobile Number******");
		return customer.isPresent();
	}

}
