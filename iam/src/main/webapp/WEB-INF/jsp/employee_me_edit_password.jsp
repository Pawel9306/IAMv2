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
                            <li><a href="/employee/account/edit">Modyfikacja atrybutów konta</a></li>
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
  <spring:url value="/employee/saveUser" var="saveURL" />
  <h3>Wprowadź obecne i nowe hasło:</h3>
  <c:set value="${userForm}" var="employee"/>
  <c:set value="${newPassForm}" var="newPass"/>

  <form:form modelAttribute="userForm" name="myForm" method="post" action="${saveURL }" cssClass="form-control" >
  	<form:hidden path="role"/>
	<form:hidden path="userId"/>
	<form:hidden path="userName"/>
	<form:hidden path="tempPK"/>
	<form:hidden path="enabled"/>
	<form:hidden path="password"/>
 
  
   	<table>

   		<tr>
   		<td><label>Obecne hasło:</label></td>
   		<td><input  id="passwordOld" class="form-control" title="Podaj dotychczasowe hasło" required="required"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Nowe hasło:</label></td>
   		<td><input  id="passwordNew1" class="form-control" title="Podaj nowe hasło" required="required"/></td>
   		</tr>
   		
   		<tr>
   		<td><label>Powtórz hasło:</label></td>
   		<td><input  class="form-control" id="passwordNew2" title="Powtórz nowe hasło" required="required"/></td>
   		</tr>
   		
   		
   		
   		<tr>
   		<td></td>
   		<td></td>
   		</tr>
   		
   	</table>

  </form:form>
  
  	<table>
  	<tr>
   		<td><button onclick="location.href='/employee/account'" class="btn btn-primary">Anuluj</button></td>
   		<td><button onclick="check()" class="btn btn-primary">Zmień hasło</button></td>
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
         
         <script type="text/javascript">
         function check(){
        	 
        	 document.forms['myForm'].submit(); return false;
         }
         
         </script>
         
         
</body>
</html>