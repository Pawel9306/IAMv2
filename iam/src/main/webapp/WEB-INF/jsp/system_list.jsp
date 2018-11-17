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
 <div id="content" style="text-align: center">
 	<div id="empList">
 	  <h2>Lista systemów:</h2>
		  <table class="table table-light" id="tableList">
		   <thead>
		    <th scope="row">System</th>
		    <th scope="row">Opis</th>
			<th scope="row">Nazwa grupy</th>
		    <th scope="row"></th>
		    <th scope="row"></th>
		    <th scope="row"></th>
		    <th scope="row"></th>
		   </thead>
		   <tbody>
		    <c:forEach items="${systemList }" var="system" >
		     <tr>
		    <td>${system.systemName}</td>
		    <td>${system.description}</td>
		    <td>${system.groupName}</td>
		    
		    <td>
		    	<div sec:authorize="hasRole('ROLE_ADMIN')">
		       <spring:url value="/employee/deleteSystem/${system.sysId }" var="deleteURL" />
		       <a class="btn btn-primary" href="${deleteURL }" role="button" >Usuń</a>
		    	</div>
		    </td>
		    <td>
		       <spring:url value="/employee/updateSystem/${system.sysId }" var="updateURL" />
		       <a class="btn btn-primary" href="${updateURL }" role="button" >Aktualizuj</a>
		    </td>
		    <td>
		       <spring:url value="/employee/accessSystem/${system.sysId }" var="accessURL" />
		       <a class="btn btn-primary" href="${accessURL }" role="button" >Wnioskuj</a>
		    </td>
		     </tr>
		    </c:forEach>
		   </tbody>
		  </table>
 
 	</div>
  
	<spring:url value="/employee/addSystem/" var="addURL" />
	<a class="btn btn-primary" href="${addURL }" role="button" >Dodaj nowy system</a>
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