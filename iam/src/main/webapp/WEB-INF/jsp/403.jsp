<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	<title>Identity and Access Management App</title>

	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/assets/css/styles.css" />
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<section class="container login-form">
	<section>
		<div class="alert alert-danger alert-error text-justify">
		
		<table>
			<tr><td>
			<div class="col-xs-11">
		      <span class="glyphicon glyphicon-remove-circle"></span> Nie masz uprawnień do wyświetlenia tej strony!
		    </div>
			</td></tr>

			<tr>
			<td>
		       <a class="btn btn-primary" href="/employee/account" role="button" >Powrót na stronę główną</a>
		    </td>
			</tr>
			
			<tr>
			<td>
		       <a class="btn btn-primary" href="/login?logout" role="button" >Zaloguj się jako inny użytkownik</a>
		    </td>
			</tr>
		</table>
		
		
		  
		</div>
	</section>
</section>	
</body>
</html>