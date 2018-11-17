
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
  

    
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
 <div id="content">
 <div class="col-5" style="margin: 0 auto">
  <spring:url value="/employee/saveEmployee" var="saveURL" />
  <h3>Edytuj swoje dane:</h3> 
  <form:form name="myForm" modelAttribute="employeeForm" method="post" action="${saveURL }" cssClass="form" >
   	<form:hidden path="employeeId"/>
	<form:hidden path="accountStatus"/>
	<form:hidden path="accountType"/>
	<form:hidden path="birthDay"/>
	<form:hidden path="branch"/>
	<form:hidden path="department"/>
	<form:hidden path="firstName"/>
	<form:hidden path="lastName"/>
	<form:hidden path="fullName"/>
	<form:hidden path="validFrom"/>
	<form:hidden path="validUntil"/>
	<form:hidden path="isManager"/>
	<form:hidden path="position"/>
   	<table>
   		<tr>
   		
   		<td><label class="blockquote">Kontakt:</label></td>
   		<td></td>
   		</tr>
   		
   		
   		<tr>
   		<td><label>Email:</label></td>
   		<td><form:input type="email" path="emailAddress" cssClass="form-control" id="emailAddress" title="Podaj adres email pracownika" /></td>
   		</tr>
   		
   		<tr>
   		<td><label>Numer telefonu:</label></td>
   		<td><form:input type="tel" path="phoneNumber" cssClass="form-control" id="phoneNumber" pattern="[0-9]{9,}" title="Podaj numer telefonu kontaktowego" required="required"/></td>
   		</tr>
   		
   		
   		<tr>
   		
   		<td><label class="blockquote">Adres:</label></td>
   		<td></td>
   		</tr>

   		<tr>
   		<td><label>Ulica:</label></td>
   		<td><form:input path="street" cssClass="form-control" id="street" pattern="[A-ZŹŻŁÓŚĆ]{1}[a-ząęółżść]{1,}" title="Podaj ulicę" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Numer domu:</label></td>
   		<td><form:input path="homeNbr" cssClass="form-control" id="homeNbr" pattern="[1-9]{1,}[a-zA-Z]{0,}" title="Podaj numer domu" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Miasto:</label></td>
   		<td><form:input path="city" cssClass="form-control" id="city" pattern="[A-ZŹŻĆŚÓŁ]{1}[a-ząęółżść]{2,}" title="Podaj nazwę miasta" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Województwo:</label></td>
   		<td><form:select path="state" cssClass="form-control" id="state" required="required" title="Wybierz województwo">
   		<form:option value="">--Wybierz--</form:option>
   		<form:option value="dolnośląskie">dolnośląskie</form:option>
		<form:option value="kujawsko-pomorskie">kujawsko-pomorskie</form:option>
		<form:option value="lubelskie">lubelskie</form:option>
		<form:option value="lubuskie">lubuskie</form:option>
		<form:option value="łódzkie">łódzkie</form:option>
		<form:option value="małopolskie">małopolskie</form:option>
		<form:option value="mazowieckie">mazowieckie</form:option>
		<form:option value="opolskie">opolskie</form:option>
		<form:option value="podkarpackie">podkarpackie</form:option>
		<form:option value="podlaskie">podlaskie</form:option>
		<form:option value="pomorskie">pomorskie</form:option>
		<form:option value="śląskie">śląskie</form:option>
		<form:option value="świętokrzyskie">świętokrzyskie</form:option>
		<form:option value="warmińsko-mazurskie">warmińsko-mazurskie</form:option>
		<form:option value="wielkopolskie">wielkopolskie</form:option>
		<form:option value="zachodnio-pomorskie">zachodnio-pomorskie</form:option>
		</form:select></td>
   		</tr>
   		<tr>
   		<td><label>Kod pocztowy:</label></td>
   		<td><form:input path="postCode" cssClass="form-control" id="postCode" pattern="[0-9]{2}[/-]{1}[0-9]{3}" title="Podaj kod pocztowy" required="required"/></td>
   		</tr>
   		
   		
   		<tr>
   		<td></td>
   		<td></td>
   		</tr>
   		
   	</table>

  </form:form>
  
  
  <table class="center">
			<tr>
	   		<td><button onclick="location.href='/employee/account'"  class="btn btn-primary">Anuluj</button></td>
	   		<td><button onclick="document.forms['myForm'].submit(); return false;" class="btn btn-primary">Potwierdź zmiany</button></td>
	   		</tr>
	</table>
  
 

  
  </div>
 </div>
 
 <!-- jQuery CDN -->
         <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
         <!-- Bootstrap Js CDN -->
         <script src="/js/bootstrap.min.js"></script>

         <script type="text/javascript">
             $(document).ready(function () {
                 $('#sidebarCollapse').on('click', function () {
                     $('#sidebar').toggleClass('active');
                 });
             });
         </script>
</body>
</html>