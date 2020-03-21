<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="edu.drexel.TrainDemo.models.Orders" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div class="jumbotron">
</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Itinerary</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Train Ticket</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        
    </div>
</nav>




	<% 
	
			List<Orders> itineraryEntries=(List<Orders>)request.getAttribute("itinerary");
			if(itineraryEntries==null)
			{
				out.print("<h1>No Bookings found!</h1>");
			}
			else if(itineraryEntries.size()==0)
			{
				out.print("<h1>No Bookings found!</h1>");
			}
			else
			{%>
				
				<table class="table">
			<thead>
	
				<tr>
					<td>OrderID</td>
					<td>CustomerName</td>
					<td>Origin Station</td>
					<td>Destination Station</td>
					<td>Depart Time</td>
					<td>Arrival Time</td>
					<td>Number of Tickets</td>
				</tr>
		
			</thead>
							
			<%				
				for(Orders order:itineraryEntries)
				{
					out.print("<tr>");
						out.print("<td>");
							out.print(order.getOrder_id());
						out.print("</td>");
						out.print("<td>");
							out.print(order.getCustomer_name());
						out.print("</td>");
						out.print("<td>");
							out.print(order.getFromstation());
						out.print("</td>");
						out.print("<td>");
							out.print(order.getTostation());
						out.print("</td>");				
						out.print("<td>");
							out.print(order.getDeparttime());
						out.print("</td>");
						out.print("<td>");
							out.print(order.getArrivaltime());
						out.print("</td>");
						out.print("<td>");
							out.print(order.getNumoftickets());
						out.print("</td>");
						
					out.print("</tr>");
				}
			}
			
			%>
	


</table>

</body>
</html>