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

<script type="text/javascript">

	function validate()
	{	alert("Ticket has been placed into Cart!")
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

	function setPrice(val, initPrice)
	{
		initPrice=initPrice*20;		
		if(val==0){
			document.getElementById("price").innerHTML=initPrice+"$";
			document.getElementsByName("classH")[0].value=""+E;
		}
		else if(val==1)
		{
			document.getElementById("price").innerHTML=initPrice+80+"$";
			document.getElementsByName("classH")[0].value=""+B;
		}
		else{
			document.getElementById("price").innerHTML=initPrice+150+"$";
			document.getElementsByName("classH")[0].value=""+P;
		}
	}

</script>

</script>
<style>
 .summary{
 	margin-top:100px;
 }
</style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="/">Train Ticket</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="ml-auto nav-item authenticated">
                <a class="nav-link" href="/Itinerary">Cart</a>
            </li>
            <li class="ml-auto nav-item authenticated dropdown">
                    <a class="nav-link" href="/" onclick="logout()">Sign Out</a>
            </li>
            
        </ul>
    </div>
</nav>

	<%
	
		String parse=(String)request.getAttribute("ticketType");		
		StringTokenizer fields = new StringTokenizer(parse,";");
	
	
	%>
<div class="summary">
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
			out.print("<td class='tableValues'>");
			lastVal=(String)fields.nextElement();
			out.print(lastVal);			
			out.print("</td>");
			out.print("</tr>");
			index++;			
		}		
		out.print("<tr><td>");
		out.print("Price");
		out.print("</td>");
		out.print("<td id='price'>");
		out.print(Integer.parseInt(lastVal)*20);
		out.print("$</td></tr>");
	%>
	
	</tr>
	
	</thead>
	
	</table>

	<table class="table-dark" align="center">
	
	<tr>
	<td>
		<input type="radio" id="eclass" name="classType" value="economy" onclick="setPrice(0,<%out.print(lastVal);%>)"/>
		<label for="economy">Economy</label>
	</td>	
	</tr>
	<tr>
	<td>
		<input type="radio" id="bclass" name="classType" value="business" onclick="setPrice(1,<%out.print(lastVal);%>)"/>
		<label for="male">Business</label><br>
	</td>
	</tr>
	<tr>
	<td>
		<input type="radio" id="pclass" name="classType" value="premium" onclick="setPrice(2,<%out.print(lastVal);%>)"/>
		<label for="male">Premium Class</label><br>
	</td>
	</tr>
		
	</table>
	<br>
	<form action="cart" action="post">
	<input type="hidden" name="ticketDetails" value="<%=parse %>" />
	<input type="hidden" name="classH" value="" />
	<div style="float:right; margin-right:100px">
	<button class="btn btn-primary" type="submit" value="Add to Cart" onclick="return validate()">Add to Cart</button>	
	</div>
	</form>	
</div>

</body>
</html>