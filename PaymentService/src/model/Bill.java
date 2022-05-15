package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Bill {
	// Connect to the DB
	public Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/billingservicedb",
					"root", "");

			// For testing
			System.out.print("Succesfully connected to the DB");
			
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}

	         //Insert Bill
			public String insertBill(String NoOfUnits, String NoOfExceededUnits, String ConnectionStatus, String CustomerID, String UnitPrice,String Month, String Year, String InputDate, String District, String TotalBill,String PaymentStatus)
			{ 
				Connection con = connect();
				String output = "";
				try
				 { 
					  
					 if (con == null) 
					 { 
					    return "Error while connecting to the database"; 
					 } 
					 
					 // create a prepared statement
					 String query = " insert into billingservice (`BillID`,`NoOfUnits`,`NoOfExceededUnits`,`ConnectionStatus`,`CustomerID`,`UnitPrice`,`Month`,`Year`,`InputDate`,`District`,`TotalBill`,`PaymentStatus`)"+ " values (?, ?, ?, ?, ?, ?,?,?, ?, ?, ?, ?)"; 
					 PreparedStatement Pstatement = con.prepareStatement(query); 
					 
					 // binding values
					 Pstatement.setInt(1, 0); 
					 Pstatement.setString(2, NoOfUnits); 
					 Pstatement.setString(3, NoOfExceededUnits); 
					 Pstatement.setString(4, ConnectionStatus); 
					 Pstatement.setString(5, CustomerID);
					 Pstatement.setString(6, UnitPrice); 
					 Pstatement.setString(7, Month); 
					 Pstatement.setString(8, Year); 
					 Pstatement.setString(9, InputDate);
					 Pstatement.setString(10, District); 
					 Pstatement.setString(11, TotalBill); 
					 Pstatement.setString(12, PaymentStatus);
					 
					 
					//execute the statement
					 
					 Pstatement.execute(); 
					 con.close();
					// System.out.println(query);
					 String newBill = readBill(); 
					 output = "{\"status\":\"success\", \"data\": \"" + 
					 newBill + "\"}"; 
					 
					// output = "Bill Inserted successfully"; 
				 } 
				
				catch (Exception e) 
				 { 
					 output = "{\"status\":\"error\", \"data\": \"Error while inserting the Bill.\"}"; 
					// output = "Error while inserting"; 
					 
					System.err.println(e.getMessage()); 
				 } 
				//binding values
				return output; 
			}

			//Read the bill
			public String readBill()
			{ 
				 String output = ""; 
				 
				 try
				 { 
				
			     Connection con = connect(); 
				 if (con == null) 
				 { 
					 return "Error while connecting to the database for reading the Bills."; 
				 } 
				 
				 
				 // Prepare the html table to be displayed
				 output = "<table class='table table-hover table-striped text-center'>"
				 		 + "<tr><th>No Of Units</th>" 
				 		+"<th>No Of Exceeded Units</th>"
						 +"<th>Connection Status</th>"
						 + "<th>Customer ID</th>"
						 + "<th>Unit Price</th>" 
						 +"<th>Month</th>"
						 +"<th>Year</th>"
						 + "<th>Input Date</th>"
						 + "<th>District</th>"
						 + "<th>Total Bill</th>"
						 + "<th>Payment Status</th>"
						 +"<th>Update</th>"
						 + "<th>Delete</th></tr>"; 
				 
				 String query = "select * from billingservice"; 
				 
				 Statement stmt = (Statement) con.createStatement(); 
				 ResultSet res = ((java.sql.Statement) stmt).executeQuery(query); 
				 
				 // iterate through the rows in the result set
				 while (res.next()) 
				 { 
					 String BillID = Integer.toString(res.getInt("BillID")); 
					 String NoOfUnits = res.getString("NoOfUnits"); 
					 String NoOfExceededUnits = res.getString("NoOfExceededUnits"); 
					 String ConnectionStatus = res.getString("ConnectionStatus"); 
					 String CustomerID = res.getString("CustomerID"); 
					 String UnitPrice = res.getString("UnitPrice");
					 String Month = res.getString("Month"); 
					 String Year = res.getString("Year"); 
					 String InputDate = res.getString("InputDate"); 
					 String District = res.getString("District"); 
					 String TotalBill = res.getString("TotalBill");
					 String PaymentStatus = res.getString("PaymentStatus");
					  
					 // Add a row into the html table
					 output += "<tr><td>" + NoOfUnits + "</td>";
					 output += "<td>" + NoOfExceededUnits + "</td>"; 
					 output += "<td>" + ConnectionStatus + "</td>";
					 output += "<td>" + CustomerID + "</td>"; 
					 output += "<td>" + UnitPrice + "</td>";
					 output += "<td>" + Month + "</td>";
					 output += "<td>" + Year + "</td>"; 
					 output += "<td>" + InputDate + "</td>";
					 output += "<td>" + District + "</td>"; 
					 output += "<td>" + TotalBill + "</td>";
					 output += "<td>" + PaymentStatus + "</td>";
					 
					 				 
					 // buttons
					 output += "<td><input name='btnUpdate' type='button' value='Update' "
							 + "class='btnUpdate btn btn-secondary' data-billid='" + BillID  + "'></td>"
							 + "<td><input name='btnRemove' type='button' value='Remove' "
							 + "class='btnRemove btn btn-danger' data-billid='" + BillID + "'></td></tr>";
				 } 
				 
				con.close(); 
				
				     // Complete the html table
				     output += "</table>"; 
				 } 
				 
				catch (Exception e) 
				 { 
					 output = "Error while reading the bill details."; 
					 System.err.println(e.getMessage()); 
				 } 
				
				
				return output; 
			}

	// Update buyers in the table
	public String updateBill(String ID, String NoOfUnits, String NoOfExceededUnits, String ConnectionStatus, String CustomerID, String UnitPrice, String Month, String Year,String InputDate, String District, String TotalBill, String PaymentStatus )
			{ 
				 String output = ""; 
				 try
				 { 
				 Connection con = connect(); 
				 if (con == null) 
				 {
					 return "Error while connecting to the database for updating the bill."; 
					 
				 } 
				 // create a prepared statement
				 String query = "UPDATE billingservice SET NoOfUnits=?, NoOfExceededUnits=?, ConnectionStatus=?, CustomerID=?, UnitPrice=?, Month=?, Year=?, InputDate=?, District=?, TotalBill=?, PaymentStatus=? WHERE BillID=?";
					
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 
				 // binding values
				 
				 preparedStmt.setString(1, NoOfUnits); 
				 preparedStmt.setString(2, NoOfExceededUnits); 
				 preparedStmt.setString(3, ConnectionStatus); 
				 preparedStmt.setString(4, CustomerID); 
				 preparedStmt.setString(5, UnitPrice); 
				 preparedStmt.setString(6, Month); 
				 preparedStmt.setString(7, Year); 
				 preparedStmt.setString(8, InputDate); 
				 preparedStmt.setString(9, District); 
				 preparedStmt.setString(10, TotalBill);
				 preparedStmt.setString(11, PaymentStatus);
				 preparedStmt.setInt(12, Integer.parseInt(ID)); 
				 
				 
				 // execute the statement
				    preparedStmt.execute();
				    System.out.println("AAA");
				    con.close(); 
				    String newBill = readBill(); 
					 output = "{\"status\":\"success\", \"data\": \"" + 
					 newBill + "\"}"; 
					 
				   // output = "Bill Updated successfully"; 
				 } 
				 
				 catch (Exception e) 
				 { 
					 output = "{\"status\":\"error\", \"data\": \"Error while Updating the Bill.\"}"; 
					 e.printStackTrace();
				     //output = "Error while updating the bill details."; 
				     //System.err.println(e); 
				 } 
				 
				 return output; 
				 }

	// Delete buyer in the table
	public String deleteBill(String BillID) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for deleting the bill.";
			}

			// create a prepared statement
			String query = "delete from billingservice where BillID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(BillID));

			// execute the statement
			preparedStmt.execute();
			con.close();

			  String newBill = readBill(); 
				 output = "{\"status\":\"success\", \"data\": \"" + 
				 newBill + "\"}"; 
		//	output = "bill details Deleted successfully";

		} catch (Exception e) {
			 output = "{\"status\":\"error\", \"data\": \"Error while Deleting the Bill.\"}"; 
		//	output = "Error while deleting the Bill details.";
			System.err.println(e);
		}

		return output;
	}

}

