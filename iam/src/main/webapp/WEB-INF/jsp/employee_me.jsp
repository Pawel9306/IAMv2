<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Article List</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<div id="sidebar">
		<div class="sidebar-header">
			<h3>IAM System</h3>
			Użytkownik: <a href="/employee/account" ><b><c:out value="${pageContext.request.remoteUser}"></c:out></b></a>


			<form action="/logout" method="post">
				<input type="submit" class="button red big" value="Wyloguj" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>

		</div>

		<ul class="list-unstyled components">
			<li><a href="#accountsSubmenu" data-toggle="collapse" aria-expanded="false">Zarządzanie kontami</a>
				<ul class="collapse list-unstyled" id="accountsSubmenu">
					<li><a href="/employee/list">Lista pracowników</a></li>
					<sec:authorize access="hasRole('ROLE_MANAGER')">
					<li><a href="/employee/list">Lista pracowników podwładnych</a></li>
					</sec:authorize>
					<li><a href="/employee/account/edit">Edytuj atrybuty konta</a></li>
					<li><a href="#">Zmień hasło logowania</a></li>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
					<li><a href="/employee/addEmployee/">Utwórz nowe konto Pracownika</a></li>
					</sec:authorize>
				</ul></li>
			<li><a href="#systemSubmenu" data-toggle="collapse"	aria-expanded="false">Systemy</a>
				<ul class="collapse list-unstyled" id="systemSubmenu">
					<li><a href="/employee/systemList">Lista dostępnych	systemów</a></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="/employee/addSystem/">Dodaj nowy system</a></li>
					</sec:authorize>
				</ul></li>
			<li><a href="#accessSubmenu" data-toggle="collapse"	aria-expanded="false">Dostępy</a>
				<ul class="collapse list-unstyled" id="accessSubmenu">
					<li><a href="#">Zamów nowe dostępy</a></li>
					<li><a href="#">Moje aktualne dostępy</a></li>
					<li><a href="#">Modyfikacja dostępów</a></li>
					<li><a href="#">Sprawdź status zamówienia</a></li>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
					<li><a href="#">Wnioski oczekujące</a></li>
					</sec:authorize>
				</ul></li>
			<li><a href="#reportsSubmenu" data-toggle="collapse" aria-expanded="false">Raporty</a>
				<ul class="collapse list-unstyled" id="reportsSubmenu">
					<li><a href="#">Historia zamówień</a></li>
					<li><a href="#">Lista dostepów do wybranych systemów</a></li>
					<li><a href="#">Aktualne dostępy pracowników</a></li>
					<li><a href="#">Lista pracowników</a></li>
				</ul></li>
			<li><a href="#">Kontakt</a></li>
		</ul>

		</div>
		

		<!-- Page Content Holder -->
		<div id="content" style="display: flex">


			<div class="col-5">
				<c:set value="${employeeForm }" var="employee" />
				<table style="min-width: 60%">
					<tbody>
						<tr>
							<td><h4>Informacje o mnie:</h4></td>
							<td style="min-width:60%"></td>
						</tr>


						<tr class="bold">
							<td>Imię:</td>
							<td class="alert-big">${employee.firstName}</td>
						</tr>

						<tr class="bold">
							<td><label>Nazwisko:</label></td>
							<td class="alert-big">${employee.lastName}</td>
						</tr>

						<tr class="bold">
							<td><label>Oddział:</label></td>
							<td class="alert-big">${employee.branch}</td>
						</tr>

						<tr class="bold">
							<td><label>Dział:</label></td>
							<td class="alert-big">${employee.department}</td>
						</tr>

						<tr class="bold">
							<td><label>Stanowisko</label></td>
							<td class="alert-big">${employee.position}</td>
						</tr>
						<!--  
						<sec:authorize access="hasRole('ROLE_USER')">
							<tr>
								<td><label>Przełożony</label></td>
								<td>Imię i nazwisko przełożonego</td>
							</tr>
						</sec:authorize>
						--> 
						<tr>
							<td><label>Adres email:</label></td>
							<td><a href="mailto:${employee.emailAddress}">${employee.emailAddress}</a></td>
						</tr>

						<tr>
							<td><label>Numer telefonu:</label></td>
							<td>${employee.phoneNumber}</td>
						</tr>

						<tr>
							<td><label>Konto aktywne od:</label></td>
							<td>${employee.validFrom}</td>
						</tr>

						<tr>
							<td><label>Ważność konta:</label></td>
							<td>${employee.validUntil}</td>
						</tr>

						<tr>
							<td><label>Data urodzenia:</label></td>
							<td>${employee.birthDay}</td>
						</tr>
						<tr>
						<tr>
							<td><label>Adres zamieszkania:</label></td>
							<td></td>
						</tr>
						<tr>
						<tr>
							<td><label>Ulica:</label></td>
							<td>${employee.street}</td>
						</tr>

						<tr>
							<td><label>Numer:</label></td>
							<td>${employee.homeNbr}</td>
						</tr>

						<tr>
							<td><label>Miasto:</label></td>
							<td>${employee.city}</td>
						</tr>

						<tr>
							<td><label>Kod:</label></td>
							<td>${employee.postCode}</td>
						</tr>

						<tr>
							<td><label>Województwo:</label></td>
							<td>${employee.state}</td>
						</tr>



					</tbody>
				</table>
			</div>


			<div class="box-1">

				<table class="table-glyphicon">
					<tr>
						<td class="glyphicon-1"><a href="/employee/account/edit"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td><a href="/employee/account/edit">Edytuj atrybuty
								konta</a></td>
					</tr>

					<tr>
						<td class="glyphicon-1"><a
							href="/employee/accout/edit/password"><span
								class=" glyphicon glyphicon-exclamation-sign "></span></a></td>
						<td><a href="/employee/accout/edit/password">Zmień hasło
								logowania</a></td>
					</tr>

					<tr>
						<td class="glyphicon-1"><a href="#"><span
								class="glyphicon glyphicon-plus-sign"></span></a></td>
						<td><a href="#">Nowy wniosek o dostęp</a></td>
					</tr>

					<tr>
						<td class="glyphicon-1"><a href="#"><span
								class="glyphicon glyphicon-check"></span></a></td>
						<td><a href="#">Sprawdź status wniosku</a></td>
					</tr>

					<tr>
						<td class="glyphicon-1"><a href="#"><span
								class="glyphicon glyphicon-menu-hamburger"></span></a></td>
						<td><a href="#">Lista dostępów</a></td>
					</tr>

				</table>
			</div>

		</div>


		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<!-- Bootstrap Js CDN -->
		<script src="/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#sidebarCollapse').on('click', function() {
					$('#sidebar').toggleClass('active');
				});
			});
		</script>
	</div>
</body>
</html>