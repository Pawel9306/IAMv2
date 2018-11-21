<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
<title>Identity and Access Management App</title>

<link
	href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/assets/css/styles.css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="security-app">
	<section class="container login-form">
		<section>
			<form action="/login" method="post">
				<img src="/assets/images/logo.png" alt="" class="img-responsive" />


				

				<div class="form-group">

					<input type="text" name="username" required class="form-control"
						placeholder="Nazwa użytkownika" /> <span
						class="glyphicon glyphicon-user"></span>
				</div>

				<div class="form-group">
					<input type="password" name="password" required
						class="form-control" placeholder="Hasło" /> <span
						class="glyphicon glyphicon-lock"></span>
				</div>

				<button type="submit" name="Login" class="btn btn-primary btn-block">Zaloguj</button>

				<c:if test="${param.logout ne null}">
				<div class="alert-normal">Zostałeś wylogowany.</div>
				</c:if>
				
				<c:if test="${param.error ne null}">
				<div class="alert-normal">Nieprawidłowa nazwa użytkownika lub hasło.</div>
				</c:if>



				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

			</form>
			
			
			
			
		</section>
	</section>

</body>
</html>
