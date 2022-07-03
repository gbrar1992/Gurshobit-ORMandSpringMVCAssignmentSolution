package com.gurshobit.cms.services;

import java.util.List;

import org.hibernate.Transaction;
import javax.transaction.Transactional;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurshobit.cms.models.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {
	SessionFactory sessionFactory;
    Session session;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
        try {
            this.session = sessionFactory.getCurrentSession();
        }catch(HibernateException he) {
            System.out.println("Exception" + he);
            this.session = sessionFactory.openSession();
        }
	}
	
	@Transactional
	public List<Customer> getAllCustomers() {
		Transaction transaction = session.beginTransaction();
        @SuppressWarnings("unchecked")
        List<Customer> customersList = (List<Customer>) session.createQuery("from Customer").list();
        transaction.commit();
        return customersList;
	}

	@Transactional
	public void save(Customer customer) {
		Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(customer);
        transaction.commit();
	}

	@Transactional
	public Customer deleteCustomerById(int id) {
		Transaction transaction = session.beginTransaction();
		Customer customer = session.get(Customer.class,id);
		session.delete(customer);
		transaction.commit();
		return customer;
	}

	@Transactional
	public Customer getCustomerById(int id) {
		Transaction transaction = session.beginTransaction();
		Customer customer = session.get(Customer.class,id);
		transaction.commit();
        return customer;
	}
	
}
