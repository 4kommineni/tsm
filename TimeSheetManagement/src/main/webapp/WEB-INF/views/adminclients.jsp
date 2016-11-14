<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - All Clients</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/admin.css">
</head>
<body class="fullheight">
 <jsp:include page="adminnavbar.jsp" />
 <div class="page-content fullheight">
  <div class="flex-grid no-responsive-future fullheight">
   <div class="row fullheight">
    <jsp:include page="adminmenu.jsp" />
    <div id="cell-content" class="carpet cell colspan10 fg-lightBlue fullheight">
     <h1 class="align-center">All Clients</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-o fa-lg"></span>
          <span class="title">All Clients</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <table id="adminClientsTable" class="table border bordered striped hovered cell-hovered">
              <thead>
               <tr>
                <th>Name</th>
                <th>Client Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zipcode</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='c' items='${allclients}'>
                <tr>
                 <c:forEach var='p' items='${allprofiles}' varStatus="i">
                  <c:if test="${p.getId() eq c.getEmployee_id()}">
                   <td>${p.getName()}</td>
                   <c:set var="i.index" value="${items.size}" />
                  </c:if>
                 </c:forEach>
                 <td>${c.getClient_name()}</td>
                 <td>${c.getAddress()}</td>
                 <td>${c.getCity()}</td>
                 <td>${c.getState()}</td>
                 <td>${c.getZipcode()}</td>
                </tr>
               </c:forEach>
              </tbody>
             </table>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
 </div>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/adminclients.js"></script>
</body>
</html>