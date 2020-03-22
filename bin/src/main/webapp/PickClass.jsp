<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.StringTokenizer" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">



</nav>

<script type="text/javascript">

	function validate()
	{
		var retValue=false;
		var fieldLength = document.getElementsByName("classType").length;
		for(var k=0;k<fieldLength;k++)
		{
				if(document.getElementsByName("classType")[k].checked==true)
				{
					retValue=true;	
					document.getElementsByName("classH")[0].value=document.getElementsByName("classType")[k].value;
				}				
		}		
		
		if(retValue==false) alert("Please select the coach type");
		
		return retValue;
	}

</script>

</head>
<body>

	<%
	
		String parse=(String)request.getAttribute("ticketType");		
		StringTokenizer fields = new StringTokenizer(parse,";");
	
	
	%>
	<hr>
	<h2>Ticket Summary</h2>
	<table class="table" align="center">
	
	<thead>
	
	<tr>
	
	<% 
		ArrayList<String> headers=new ArrayList<String>();
		int index=0;
		String lastVal="0";
		headers.add(0,"FromStation");
		headers.add(1,"ToStation");
		headers.add(2,"TripID");
		headers.add(3,"Departure Time");
		headers.add(4,"Arrival Time");
		headers.add(5,"Stop Sequence");		
		while(fields.hasMoreElements())
		{
			out.print("<tr>");
			out.print("<td>");
			out.print(headers.get(index));
			out.print("</td>");
			out.print("<td>");
			lastVal=(String)fields.nextElement();
			out.print(lastVal);			
			out.print("</td>");
			out.print("</tr>");
			index++;			
		}		
		out.print("<tr><td>");
		out.print("Price");
		out.print("</td>");
		out.print("<td>");
		out.print(Integer.parseInt(lastVal)*20);
		out.print("$</td></tr>");
	%>
	
	</tr>
	
	</thead>
	
	</table>

	<table class="table-dark" align="center">
	
	<tr>
	<td>
		<input type="radio" id="eclass" name="classType" value="economy"/>
		<label for="economy">Economy</label>
	</td>	
	</tr>
	<tr>
	<td>
		<input type="radio" id="bclass" name="classType" value="business"/>
		<label for="male">Business</label><br>
	</td>
	</tr>
	<tr>
	<td>
		<input type="radio" id="pclass" name="classType" value="premium"/>
		<label for="male">Premium Class</label><br>
	</td>
	</tr>
		
	</table>
	<br>
	<form action="cart" action="post">
	<input type="hidden" name="ticketDetails" value="<%=parse %>" />
	<input type="hidden" name="classH" value="" />
	<div style="float:right; margin-right:100px">
	<input class="btn btn-primary" type="submit" value="Add to Cart" onclick="return validate()">	
	</div>
	</form>

</body>
</html>