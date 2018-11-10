<%-- include calendar stylesheet, javascripts and extra function - Put this in the html header--%>
<jsp:include page="calendar.jsp" />
<%-- Below is how you add your field --%>

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
 <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>IAM System</h3>
         Użytkownik: <b><c:out value="${pageContext.request.remoteUser}"></c:out></b>

	    <form action="/logout" method="post">
			<input type="submit" class="button red big" value="Wyloguj" /> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	    
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="#accountsSubmenu" data-toggle="collapse" aria-expanded="false">Zarządzanie kontami</a>
                        <ul class="collapse list-unstyled" id="accountsSubmenu">
							<li><a href="/employee/list">Lista pracowników</a></li>
                            <li><a href="/employee/addEmployee/">Utwórz nowe konto</a></li>
                            <li><a href="#">Modyfikacja atrybutów konta</a></li>
                            <li><a href="#">Dezaktywacja konta</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#systemSubmenu" data-toggle="collapse" aria-expanded="false">Systemy</a>
                        <ul class="collapse list-unstyled" id="systemSubmenu">
                            <li><a href="/employee/systemList">Lista dostępnych systemów</a></li>
                            <li><a href="/employee/addSystem/">Dodaj nowy system</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#accessSubmenu" data-toggle="collapse" aria-expanded="false">Dostępy</a>
                        <ul class="collapse list-unstyled" id="accessSubmenu">
                            <li><a href="#">Zamów nowe dostępy</a></li>
                            <li><a href="#">Twoje aktualne dostępy</a></li>
                            <li><a href="#">Modyfikacja dostępów</a></li>
							<li><a href="#">Sprawdź status zamówienia</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#reportsSubmenu" data-toggle="collapse" aria-expanded="false">Raporty</a>
                        <ul class="collapse list-unstyled" id="reportsSubmenu">
						    <li><a href="#">Historia zamówien</a></li>
                            <li><a href="#">Lista dostepów do wybranych systemów</a></li>
                            <li><a href="#">Aktualne dostępy pracowników</a></li>
                            <li><a href="#">Lista pracowników</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Kontakt</a>
                    </li>
                </ul>

            </nav>
             <!-- Page Content Holder -->
 <div id="content">
 <div class="col-5" style="margin: 0 auto">
  <spring:url value="/employee/saveEmployee" var="saveURL" />
  <h3>Podaj dane użytkownika:</h3>
  <form:form modelAttribute="employeeForm" method="post" action="${saveURL }" cssClass="form-control" >
   <form:hidden path="employeeId"/>

   	<table>

   		<tr>
   		<td><label>Imię</label></td>
   		<td><form:input type="text" path="firstName" cssClass="form-control" id="firstName" pattern="[A-ZŹŻŁ]{1}[a-ząęółżść]{2,}" title="Podaj imię pracownika" required="required"/></td>
   		</tr>  		
   		
   		<tr>
   		<td><label>Nazwisko</label></td>
   		<td><form:input path="lastName" cssClass="form-control" id="lastName" pattern="[A-ZŹŻŁĆÓŚĆ]{1}[a-ząęółżść]{2,}" title="Podaj nazwisko pracownika" required="required"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Pełna nazwa</label></td>
   		<td><form:input path="fullName" cssClass="form-control" id="fullName" /></td>
   		</tr>
   		
   		<tr>
   		<td><label>Email</label></td>
   		<td><form:input type="email" path="emailAddress" cssClass="form-control" id="emailAddress" title="Podaj adres email pracownika" /></td>
   		</tr>
   		
   		<tr>
   		<td><label>Numer telefonu</label></td>
   		<td><form:input type="tel" path="phoneNumber" cssClass="form-control" id="phoneNumber" pattern="[0-9]{9,}" title="Podaj numer telefonu kontaktowego" required="required"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Typ konta</label></td>
   		<td><form:select  path="accountType" cssClass="form-control" id="accountType" title="Wybierz typ konta pracowniczego">
		    <form:option value="User">Pracownik</form:option>
		    <form:option value="Manager">Manager</form:option>
		    <form:option value="Administrator">Administrator</form:option>
		    </form:select></td>
   		</tr>
   		
   		<tr>
   		<td><label>Status konta</label></td>
   		<td><form:select path="accountStatus" cssClass="form-control" id="accountStatus" title="Wybierz status konta">
   			<form:option value="A">Aktywne</form:option>
		    <form:option value="N">Nieaktywne</form:option>
		    </form:select></td>
   		</tr>
   		
   		<tr>
   		<td><label>Aktywne od:</label></td>
   		<td><form:input path="validFrom" cssClass="form-control" id="validFrom" title="Podaj datę aktywacji konta"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Aktywne do:</label></td>
   		<td><form:input path="validUntil" cssClass="form-control" id="validUntil" title="Podaj datę ważności konta"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Manager?</label></td>
   		<td><form:select path="isManager" cssClass="form-control" id="isManager" title="Czy użytkownik ma mieć status Managera?">
   		<form:option value="N">Nie</form:option>
		<form:option value="Y">Tak</form:option>
		</form:select></td>
   		</tr>
   		<tr>
   		<td><label>Ulica</label></td>
   		<td><form:input path="street" cssClass="form-control" id="street" pattern="[A-ZŹŻŁÓŚĆ]{1}[a-ząęółżść]{1,}" title="Podaj ulicę" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Numer domu</label></td>
   		<td><form:input path="homeNbr" cssClass="form-control" id="homeNbr" pattern="[1-9]{1,}[a-zA-Z]{0,}" title="Podaj numer domu" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Miasto</label></td>
   		<td><form:input path="city" cssClass="form-control" id="city" pattern="[A-ZŹŻĆŚÓŁ]{1}[a-ząęółżść]{2,}" title="Podaj nazwę miasta" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Województwo</label></td>
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
   		<td><label>Kod pocztowy</label></td>
   		<td><form:input path="postCode" cssClass="form-control" id="postCode" pattern="[0-9]{2}[/-]{1}[0-9]{3}" title="Podaj kod pocztowy" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Data urodzenia</label></td>
   		<td><form:input path="birthDay" cssClass="form-control" id="birthDay" title="Podaj datę urodzenia pracownika"/></td>
   		</tr>
   		<tr>
   		<td><label>Oddział</label></td>
   		<td><form:input path="branch" cssClass="form-control" id="branch" title="Podaj nazwę oddziału"/></td>
   		</tr>
   		<tr>
   		<td><label>Dział</label></td>
   		<td><form:input path="department" cssClass="form-control" id="department" title="Podaj nazwę działu"/></td>
   		</tr>
   		<tr>
   		<td><label>Stanowisko</label></td>
   		<td><form:input path="position" cssClass="form-control" id="position" title="Podaj nazwę stanowiska" required="required"/></td>
   		</tr>
   		<tr>
   		<td><label>Opis stanowiska</label></td>
   		<td><form:textarea path="positionDesc" cssClass="form-control" id="positionDesc" title="Podaj opis zajmowanego stanowiska"/></td>
   		</tr>
   		<tr>
   		<td><button type="reset" class="btn btn-primary">Wyczyść dane</button></td>
   		<td><button type="submit" class="btn btn-primary">Dodaj pracownika</button></td>
   		</tr>
   		
   		<tr>
   		<td></td>
   		<td></td>
   		</tr>
   		
   	</table>

  </form:form>
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