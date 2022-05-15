<%@page import="model.Bill"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Bill</title>
<link rel="stylesheet" href="View/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/bill.js"></script>
</head>
<body>
<div class="container-fluid">
<div class="jumbotron" style="background-color: #1c2331;color:white;">
<h1>ElectroGrid Systems</h1>
<h3>Bill Management</h3>
<h3>IT20083182</h3>
<div class="navigation" style="float: right">
<ul class="nav nav-pills">
<li class="nav-item"><a class="nav-link text-light" href="#">Home</a></li>
<li class="nav-item"><a class="nav-link disabled text-light" href="#">Power
Management</a></li>
<li class="nav-item"><a class="nav-link text-light" href="#">Billing</a>
</li>
<li class="nav-item"><a class="nav-link text-light" href="#">Customer
Management</a></li>
<li class="nav-item"><a class="nav-link text-light" href="#">Help</a></li>
</ul>
</div>
</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card bg-light mb-3 border-danger">
					<div class="card-header bg-dark text-light">
						<h4>Bill</h4>
					</div>
					<div class="card-body ">
						
						<form id="formBill" name="formBill" method="post" action="bill.jsp" class="col">
					

				
				    No Of Units:
					<input id="NoOfUnits" name="NoOfUnits" type="number" class="form-control form-control-sm mt-2" type="number"> <br> 
					No of Exceeded Units: 
					<input id="NoOfExceededUnits" name="NoOfExceededUnits" type="number" class="form-control form-control-sm" type="number"> <br>
					Connection Status: 
							<select id="ConnectionStatus" name="ConnectionStatus" class="form-control form-control-sm mb-3">
							<option selected></option>
							<option value="Connected">Connected</option>
							 <option value="NotConnected">NotConnected</option>
							<option value="other">Other</option>
							  </select>	
					
					Customer ID: 
					<input id="CustomerID" name="CustomerID" type="text" class="form-control form-control-sm"> <br> 
				    Unit Price:
					<input id="UnitPrice" name="UnitPrice" type="number" class="form-control form-control-sm"> <br>
													
					Month:
								<select id="Month" name="Month" class="form-control form-control-sm mb-2">
								<option selected>Select a Month</option>
								<option value="January">January</option>
								<option value="February">February</option>
								<option value="March">March</option>
								<option value="April">April</option>
								<option value="May">May</option>
								<option value="June">June</option>
								<option value="July">July</option>
								<option value="August">August</option>
								<option value="September">September</option>
								<option value="Octomber">October</option>
								<option value="November">November</option>
								<option value="December">December</option> 
								</select>
														
					Year:
								<select id="Year" name="Year" class="form-control form-control-sm mb-2">
								<option selected>Select a Year</option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>		
								</select>
								
						 Input Date:
					<input id="InputDate" name="InputDate" type="number" class="form-control form-control-sm"> <br>
						
						 District:
					<input id="District" name="District" type="text" class="form-control form-control-sm"> <br>
						
						 Total Bill:
					<input id="TotalBill" name="TotalBill" type="number" class="form-control form-control-sm"> <br>
						
						Payment Status: 
							<select id="PaymentStatus" name="PaymentStatus" class="form-control form-control-sm mb-3">
							<option selected></option>
							<option value="Paid">Paid</option>
							 <option value="NotPaid">NotPaid</option>
							<option value="Pending">Pending</option>
							  </select>	
								
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					<input type=" " id="hidBillIDSave" name="hidBillIDSave">
				</form>

						
					</div>
					<div class="card-footer text-light">
						Status:<br/>
						<div id="alertSuccess" class="alert alert-success"></div>
						<div id="alertError" class="alert alert-danger"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="text-center">
					<h4>Recent Bill History Status</h4>
					<hr>
					<br>
				</div>
				<div class="card">
					<div class="table-responsive-md border-danger">
					<div id="divBillGrid">

						<%
						Bill billObj = new Bill();
								out.print(billObj.readBill());
					%>
						</div>
					</div>
					<div class="">
						<nav aria-label="...">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#"
									tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<footer
class="text-center text-lg-start text-white mt-3"
style="background-color: #1c2331"
>
<!-- Section: Social media -->
<section
class="d-flex justify-content-between p-4"
style="background-color: #6351ce"
>
<!-- Left -->
<div class="me-5">
<span>Get connected with us on social networks:</span>
</div>
<!-- Left -->



<!-- Right -->
<div>
<a href="" class="text-white me-4">
<i class="fab fa-facebook-f"></i>
</a>
<a href="" class="text-white me-4">
<i class="fab fa-twitter"></i>
</a>
<a href="" class="text-white me-4">
<i class="fab fa-google"></i>
</a>
<a href="" class="text-white me-4">
<i class="fab fa-instagram"></i>
</a>
<a href="" class="text-white me-4">
<i class="fab fa-linkedin"></i>
</a>
<a href="" class="text-white me-4">
<i class="fab fa-github"></i>
</a>
</div>
<!-- Right -->
</section>
<!-- Section: Social media -->



<!-- Section: Links -->
<section class="">
<div class="container text-center text-md-start mt-5">
<!-- Grid row -->
<div class="row mt-3">
<!-- Grid column -->
<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
<!-- Content -->
<h6 class="text-uppercase fw-bold">PAF Project</h6>
<hr
class="mb-4 mt-0 d-inline-block mx-auto"
style="width: 60px; background-color: #7c4dff; height: 2px"
/>
<p>
Billing Management<br/>
IT20083182<br/>
</p>
</div>
<!-- Grid column -->



<!-- Grid column -->
<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
<!-- Links -->
<h6 class="text-uppercase fw-bold">Project</h6>
<hr
class="mb-4 mt-0 d-inline-block mx-auto"
style="width: 60px; background-color: #7c4dff; height: 2px"
/>
<p>
<a href="#!" class="text-white">Home</a>
</p>
<p>
<a href="#!" class="text-white">Bill</a>
</p>
<p>
<a href="#!" class="text-white">Power</a>
</p>
</div>
<!-- Grid column -->



<!-- Grid column -->
<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
<!-- Links -->
<h6 class="text-uppercase fw-bold">Useful links</h6>
<hr
class="mb-4 mt-0 d-inline-block mx-auto"
style="width: 60px; background-color: #7c4dff; height: 2px"
/>
<p>
<a href="#!" class="text-white">Your Account</a>
</p>
<p>
<a href="#!" class="text-white">Become an Affiliate</a>
</p>
<p>
<a href="#!" class="text-white">Shipping Rates</a>
</p>
</div>
<!-- Grid column -->



<!-- Grid column -->
<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
<!-- Links -->
<h6 class="text-uppercase fw-bold">Contact</h6>
<hr
class="mb-4 mt-0 d-inline-block mx-auto"
style="width: 60px; background-color: #7c4dff; height: 2px"
/>
<p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
<p><i class="fas fa-envelope mr-3"></i> info@example.com</p>
<p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>

</div>
<!-- Grid column -->
</div>
<!-- Grid row -->
</div>
</section>
<!-- Section: Links -->



<!-- Copyright -->
<div
class="text-center p-3"
style="background-color: rgba(0, 0, 0, 0.2)"
>
© 2020 Copyright:
<a class="text-white" href="https://mdbootstrap.com/"
>MDBootstrap.com</a
>
</div>
<!-- Copyright -->
</footer>
	</div>
</body>
</html>
