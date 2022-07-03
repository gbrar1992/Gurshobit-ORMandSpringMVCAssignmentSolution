<%--
  User: Gurshobit Singh Brar
  Date: 2022-07-03
  Time: 1:20 PM
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><c:if test="${formMode == 'create'}">Create</c:if><c:if test="${formMode != 'create'}">Update</c:if> Customer</title>
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
				<a href="/CustomerManagementSystem/" class="btn btn btn-dark btn-sm mb-2"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left"><polyline points="11 17 6 12 11 7"></polyline><polyline points="18 17 13 12 18 7"></polyline></svg> Back to Customers List</a>
    			<h3><c:if test="${formMode == 'create'}">Create</c:if><c:if test="${formMode != 'create'}">Update</c:if> Customer</h3>
    		</div>
    		<div class="col-12"></div>
    		<div class="col-12">
    			<div class="row">
					<form action="/CustomerManagementSystem/save-customer" method="post">
						<input type="hidden" name="customerId" value="${singleCustomer.id}">
						<div class="col-3">
							<label class="form-label">First Name</label>
							<input type="text"  name="customerFirstName" value="${singleCustomer.customerFirstName}" placeholder="Customer First Name" class="form-control mb-4 col-4">
						</div>
						<div class="col-3">
							<label class="form-label">Last Name</label>
							<input type="text"  name="customerLastName" value="${singleCustomer.customerLastName}" placeholder="Customer Last Name" class="form-control mb-4 col-4">
						</div>
						<div class="col-3">
							<label class="form-label">Email</label>
							<input type="email"  name="customerEmail" value="${singleCustomer.customerEmail}" placeholder="Coustomer Email" class="form-control mb-4 col-4">
						</div>
						<button type="submit" class="btn btn-warning col-1"><c:if test="${formMode == 'create'}"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg> Create</c:if><c:if test="${formMode != 'create'}"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-ccw"><polyline points="1 4 1 10 7 10"></polyline><polyline points="23 20 23 14 17 14"></polyline><path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"></path></svg> Update</c:if></button>
					</form>
    			
    			</div>
    		</div>
    	</div>	
    
    </div>
  </body>
</html>