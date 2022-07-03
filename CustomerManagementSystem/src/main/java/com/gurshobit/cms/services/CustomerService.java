package com.gurshobit.cms.services;

import java.util.List;

import com.gurshobit.cms.models.Customer;

public interface CustomerService {
	
	public List<Customer> getAllCustomers();
    public void save(Customer customer);
    public Customer deleteCustomerById(int id);
    public Customer getCustomerById(int id);

}
