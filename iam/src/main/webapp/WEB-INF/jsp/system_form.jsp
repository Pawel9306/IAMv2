<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Article List</title>
 <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
 <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
 <!-- Bootstrap Components -->
 <link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
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
  <spring:url value="/employee/saveSystem" var="saveURL" />
  <h2>Podaj dane nowego systemu</h2>
  <form:form modelAttribute="systemForm" method="post" action="${saveURL }" cssClass="form" >
   <form:hidden path="sysId"/>
   
   <table>
   		<tr>
   		<td><label>Nazwa:</label></td>
   		<td><form:input type="text" path="systemName" cssClass="form-control" id="systemName" pattern="{2,}" title="Podaj nazwę systemu" required="required"/></td>
		</tr>  		
   		
   		<tr>
   		<td><label>Opis:</label></td>
   		<td><form:textarea path="description" cssClass="form-control" id="description" title="Podaj opis systemu" /></td>
   		</tr>
   		
        <tr>
        <td><label>Nazwa grupy roboczej:</label></td>
        <td><form:input path="groupName" cssClass="form-control" id="groupName" title="Podaj nazwę grupy systemów" required="required"/></td>
        </tr>	
   		
   		<c:choose>
   		<c:when test="${systemForm.systemName eq null}">
   			<tr>
	   		<td><button type="reset" class="btn btn-primary">Wyczyść dane</button></td>
	   		<td><button type="submit"  class="btn btn-primary">Dodaj system</button></td>
	   		</tr>
   		</c:when>
   		<c:otherwise>
   			<tr>
	   		<td><button onclick="location.href='/employee/systemList'" class="btn btn-primary">Anuluj</button></td>
	   		<td><button type="submit" class="btn btn-primary">Potwierdź zmiany</button></td>
	   		</tr>
   		</c:otherwise>
   		</c:choose>
   		
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