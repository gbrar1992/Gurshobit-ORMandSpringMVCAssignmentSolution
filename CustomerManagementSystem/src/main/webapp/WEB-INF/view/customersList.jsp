<%--
  User: Gurshobit Singh Brar
  Date: 2022-07-03
  Time: 1:10 PM
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customers</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
  </head>
  <body>
    <div class="container">
    	<div class="row">
    		<div class="col-12 text-center">
    			<h1 class="p-5 bg-warning text-dark"><svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg> Customer Management System</h1>
			</div>
    	</div>
    	<div class="row">
    		<div class="col">
				<a href="/CustomerManagementSystem/add-customer" class="btn btn-dark btn-sm mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg> Add</a>
 				<h3>Customer</h3>
    		</div>
    		<div class="col-12">
    			<table class="table table-bordered table-striped">
					<thead  class="thead-dark">
						<tr>
							<th class="p-2">ID</th>
							<th class="p-2">First Name</th>
							<th class="p-2">Last Name</th>
							<th class="p-2">Email</th>
							<th class="p-2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${customersList.size() > 0}">
							<c:forEach items="${customersList}" var="singleCustomer">
								<tr>
									<td><c:out value="${singleCustomer.id}"></c:out></td>
									<td><c:out value="${singleCustomer.customerFirstName}"></c:out></td>
									<td><c:out value="${singleCustomer.customerLastName}"></c:out></td>
									<td><c:out value="${singleCustomer.customerEmail}"></c:out></td>
									<td>
										<a href="/CustomerManagementSystem/update-customer?customerId=${singleCustomer.id}" class="btn btn-warning btn-sm"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg> Edit</a>
										<a href="/CustomerManagementSystem/delete-customer?customerId=${singleCustomer.id}" class="btn btn-danger btn-sm" onclick="if(!(confirm('Are you sure to delete this customer?'))) return false"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> Delete</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${customersList.size() <= 0}">
							<tr>
								<td class="text-center" colspan="5">No Customers</td>
							</tr>
						</c:if>
					</tbody>
				</table>
    		</div>
    	</div>	
    
    </div>
  </body>
</html>