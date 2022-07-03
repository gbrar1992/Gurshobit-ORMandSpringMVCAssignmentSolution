package com.gurshobit.cms.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gurshobit.cms.models.Customer;
import com.gurshobit.cms.services.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/")
	public String customersList(Model customerModelView) {
		List<Customer> customers = customerService.getAllCustomers();
		customerModelView.addAttribute("customersList", customers);
		return "customersList";
	}
	
	@RequestMapping("/add-customer")
	public String customerAdd(Model customerModelView) {
		Customer singleCustomer = new Customer();
		customerModelView.addAttribute("singleCustomer", singleCustomer);
		customerModelView.addAttribute("formMode", "create");
		return "customerForm";
	}

	@RequestMapping("/update-customer")
	public String customerUpdate(@RequestParam("customerId") int customerId, Model customerModelView) {
		Customer singleCustomer = customerService.getCustomerById(customerId);
		customerModelView.addAttribute("singleCustomer", singleCustomer);
		customerModelView.addAttribute("formMode", "edit");
		return "customerForm";
	}
	
	@RequestMapping("/delete-customer")
	public String customerDelete(@RequestParam("customerId") int customerId) {
		Customer singleCustomer = customerService.deleteCustomerById(customerId);
		System.out.println("Deleted Customer Id"+ singleCustomer.getId());
	    return "redirect:/";
	}
	
	@PostMapping("/save-customer")
	public String customerSave(@RequestParam("customerId") int customerId,
			@RequestParam("customerFirstName") String customerFirstName, @RequestParam("customerLastName") String customerLastName,
			@RequestParam("customerEmail") String customerEmail) {
		Customer singleCustomer;
		if(customerId != 0) {
			singleCustomer = customerService.getCustomerById(customerId);
		} else {
			singleCustomer = new Customer();
		}
		
		singleCustomer.setCustomerFirstName(customerFirstName);
		singleCustomer.setCustomerLastName(customerLastName);
		singleCustomer.setCustomerEmail(customerEmail);
		customerService.save(singleCustomer);
		 return "redirect:/";
	}
	
}
