$(document).ready(function()
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 
$(document).on("click", "#btnSave", function(event)
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateBillForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidBillIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "BillAPI", 
 type : type, 
 data : $("#formBill").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onBillSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onBillSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divBillGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 
 $("#hidBillIDSave").val(""); 
 $("#formItem")[0].reset(); 
}

$(document).on("click", ".btnUpdate", function(event)
{ 
$("#hidBillIDSave").val($(this).data("#BillID")); 
 $("#NoOfUnits").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#NoOfExceededUnits").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#ConnectionStatus").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#CustomerID").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#UnitPrice").val($(this).closest("tr").find('td:eq(4)').text()); 
 $("#Month").val($(this).closest("tr").find('td:eq(5)').text()); 
 $("#Year").val($(this).closest("tr").find('td:eq(6)').text()); 
 $("#InputDate").val($(this).closest("tr").find('td:eq(7)').text()); 
 $("#District").val($(this).closest("tr").find('td:eq(8)').text()); 
 $("#TotalBill").val($(this).closest("tr").find('td:eq(9)').text()); 
 $("#PaymentStatus").val($(this).closest("tr").find('td:eq(10)').text());
});

$(document).on("click", ".btnRemove", function(event)
{ 
 $.ajax( 
 { 
 url : "BillAPI", 
 type : "DELETE", 
 data : "BillID=" + $(this).data("billid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onBillDeleteComplete(response.responseText, status); 
 } 
 }); 
});

function onBillDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divBillGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}
function validateBillForm() 
{
	//No Of Units
	if ($("#NoOfUnits").val().trim() == "")
	{
	return "Insert No Of Units.";
	}
	
	// No Of Exceeded Units
	if ($("#NoOfExceededUnits").val().trim() == "")
	{
	return "Insert No Of Exceeded Units.";
	}
	
	// Connection Status-------------------------------
	if ($("#ConnectionStatus").val().trim() == "")
	{
	return "Insert Connection Status.";
	}
	
	// Customer ID-------------------------------
	if ($("#CustomerID").val().trim() == "")
	{
	return "Insert Customer ID.";
	}
	
	
	// UnitPrice-------------------------------
	if ($("#UnitPrice").val().trim() == "")
	{
	return "Insert UnitPrice.";
	}
	
	//NAME
	if ($("#Month").val().trim() == "")
	{
	return "Insert Month.";
	}
	
	//Year
	if ($("#Year").val().trim() == "")
	{
	return "Insert Year.";
	}
	
	//InputDate
	if ($("#InputDate").val().trim() == "")
	{
	return "Insert Input Date.";
	}
	
	//District
	if ($("#District").val().trim() == "")
	{
	return "Insert District.";
	}
	
	//TotalBill
	if ($("#TotalBill").val().trim() == "")
	{
	return "Insert TotalBill.";
	}
	
	//PaymentStatus
	if ($("#PaymentStatus").val().trim() == "")
	{
	return "Insert PaymentStatus.";
	}
	
	
return true; 
}
