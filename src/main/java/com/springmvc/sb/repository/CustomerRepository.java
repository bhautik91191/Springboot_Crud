package com.springmvc.sb.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.springmvc.sb.model.Customer;

/**
* Since I want to validate mobile and email so there is no duplicate entries in the database 
* for that i need to check in database first, since we can only access database through Repository
* 
* @author  Bhautik Padmani
* @version 11
* @since   March 2014 
*/
public interface CustomerRepository extends JpaRepository<Customer, Integer >{

	Optional<Customer> findByEmail(String email);

	Optional<Customer> findByMobile(String mobile);

}
