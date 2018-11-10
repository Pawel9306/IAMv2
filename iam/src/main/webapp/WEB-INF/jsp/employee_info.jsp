<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>   
    
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
 <div id="content" >
 
 	<div class="col-4" >
   		<table>
			<c:set value="${employeeObject }" var="employee" />
			
	   		<tr>
	   		<label style="font-size:1.5em">Informacje o użytkowniku ${employee.firstName} ${employee.lastName}</label>
	   		
	   		</tr>  	
	   		
	   		<tr>
	   		<td><label>Imię</label></td>
	   		<td>${employee.firstName}</td>
	   		</tr> 	
	   		
	   		<tr>
	   		<td><label>Nazwisko</label></td>
	   		<td>${employee.lastName}</td>
	   		</tr>
	   		
	   		<tr>
	   		<td><label>Pełna nazwa</label></td>
	   		<td>${employee.fullName}</td>
	   		</tr>
	   		
	   		<tr>
	   		<td><label>Email</label></td>
			<td>${employee.emailAddress}</td>	   		
			</tr>
	   		
	   		<tr>
	   		<td><label>Numer telefonu</label></td>
	   		<td>${employee.phoneNumber}</td>
	   		</tr>
	   		
	   		<tr>
	   		<td><label>Typ konta</label></td>
	   		<td>${employee.accountType}</td>
	   		</tr>
   		
	   		<tr>
	   		<td><label>Oddział</label></td>
	   		<td>${employee.branch}</td>
	   		</tr>
	   		
	   		<tr>
	   		<td><label>Dział</label></td>
	   		<td>${employee.department}</td></tr>
	   		<tr>
	   		
	   		<td><label>Stanowisko</label></td>
	   		<td>${employee.position}</td>
	   		</tr>
	   		
	   		
	   		
	   		
   		</table>
 	</div>
 
 
 
 
 <!--  
 	<div id="empList">
 	  <h2>Lista pracowników:</h2>
		  <table class="table table-light" id="tableList">
		   <thead>
		    <th scope="row">Imię</th>
		    <th scope="row">Nazwisko</th>
			<th scope="row">Email</th>
			<th scope="row">Typ konta</th>
			<th scope="row">Oddział</th>
			<th scope="row">Dział</th>
			<th scope="row">Stanowisko</th>
		    <th scope="row"></th>
		    <th scope="row"></th>
		    <th scope="row"></th>
		   </thead>
		   <tbody>
		    <c:forEach items="${employeeList }" var="employee" >
		     <tr>
		    <td>${employee.firstName}</td>
		    <td>${employee.lastName}</td>
		    <td>${employee.emailAddress}</td>
		    <td>${employee.accountType}</td>
		    <td>${employee.branch}</td>
		    <td>${employee.department}</td>
		    <td>${employee.position}</td>
		    <td><spring:url value="/employee/${employee.employeeId }" var="userURL" />
		       <a class="btn btn-primary" href="${userURL }" role="button" >Przejdź</a>
		    </td>
		    <td>
		       <spring:url value="/employee/updateEmployee/${employee.employeeId }" var="updateURL" />
		       <a class="btn btn-primary" href="${updateURL }" role="button" >Aktualizuj</a>
		    </td>
		    <td>
		       <spring:url value="/employee/deleteEmployee/${employee.employeeId }" var="deleteURL" />
		       <a class="btn btn-primary" href="${deleteURL }" role="button" >Usuń</a>
		    </td>
		     </tr>
		    </c:forEach>
		   </tbody>
		  </table>
 
 	</div>
--> 
 
 
 
 <!--POPRZEDNIA LISTA
  <h2>Lista pracowników</h2>
  <table class="table table-bordered" style="width: 300px">
   <thead>
    <th scope="row">#ID</th>
    <th scope="row">Imie</th>
    <th scope="row">Nazwisko</th>
	<th scope="row">Pelna nazwa</th>
	<th scope="row">Email</th>
	<th scope="row">Numer telefonu</th>
	<th scope="row">Typ konta</th>
	<th scope="row">Status konta</th>
	<th scope="row">Aktywne od:</th>
	<th scope="row">Aktywne do:</th>
	<th scope="row">Manager?</th>
	<th scope="row">Ulica</th>
	<th scope="row">Numer domu</th>
	<th scope="row">Miasto</th>
	<th scope="row">Województwo</th>
	<th scope="row">Kod pocztowy</th>
	<th scope="row">Data urodzenia</th>
	<th scope="row">Oddzial</th>
	<th scope="row">Dzial</th>
	<th scope="row">Stanowisko</th>
	<th scope="row">Opis stanowiska</th>
    <th scope="row">Update</th>
    <th scope="row">Delete</th>
   </thead>
   <tbody>
    <c:forEach items="${employeeList }" var="employee" >
     <tr>
    <td>${employee.employeeId}</td>
    <td>${employee.firstName}</td>
    <td>${employee.lastName}</td>
    <td>${employee.fullName}</td>
    <td>${employee.emailAddress}</td>
    <td>${employee.phoneNumber}</td>
    <td>${employee.accountType}</td>
    <td>${employee.accountStatus}</td>
    <td>${employee.validFrom}</td>
    <td>${employee.validUntil}</td>
    <td>${employee.isManager}</td>
    <td>${employee.street}</td>
    <td>${employee.homeNbr}</td>
    <td>${employee.city}</td>
    <td>${employee.state}</td>
    <td>${employee.postCode}</td>
    <td>${employee.birthDay}</td>
    <td>${employee.branch}</td>
    <td>${employee.department}</td>
    <td>${employee.position}</td>
    <td>${employee.positionDesc}</td>
      <td>
       <spring:url value="/employee/updateEmployee/${employee.employeeId }" var="updateURL" />
       <a class="btn btn-primary" href="${updateURL }" role="button" >Aktualizuj</a>
      </td>
      <td>
       <spring:url value="/employee/deleteEmployee/${employee.employeeId }" var="deleteURL" />
       <a class="btn btn-primary" href="${deleteURL }" role="button" >Usuń</a>
      </td>
     </tr>
    </c:forEach>
   </tbody>
  </table>
  -->
  
  
  
  

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