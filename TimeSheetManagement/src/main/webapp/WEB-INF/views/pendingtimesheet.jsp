<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Pending TimeSheets</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="resources/css/timesheet.css">
</head>
<body>
 <jsp:include page="navbar.jsp"></jsp:include>
 <div class="page-content">
  <div class="flex-grid no-responsive-future">
   <div class="row">
    <jsp:include page="menu.jsp"></jsp:include>
    <div id="cell-content" class="carpet cell colspan10 fg-darkBlue">
     <ul class="breadcrumbs2">
      <li><a href="home"><span class="icon mif-home"></span></a></li>
      <li><a href="#">Time Sheet</a></li>
      <li><a href="#">View Pending TimeSheets</a></li>
     </ul>
     <h1 class="align-center">View Pending TimeSheets</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-o fa-lg"></span>
          <span class="title">Pending Time Sheets</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <table id="pendingTable" class="table border bordered striped hovered cell-hovered">
              <thead>
               <tr>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Hours</th>
                <th>Status</th>
                <th>Download</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='ts' items='${alltimesheets}'>
                <c:if test="${ts.getStatus()  eq 'PENDING' }">
                 <tr>
                  <td>${ts.getStart_date()}</td>
                  <td>${ts.getEnd_date()}</td>
                  <td>${ts.getHours()}</td>
                  <td>${ts.getStatus()}</td>
                  <td><a href='getClearTimeSheet/${ts.getTimesheet_id()}' target='_blank'> <span class="mif-printer"></span>
                    Print
                  </a> &nbsp;|&nbsp; <a href='getUploadedFile/${ts.getTimesheet_id()}' target='_blank'> <span
                     class="mif-file-download"></span> Client TS
                  </a></td>
                 </tr>                 
                </c:if>
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
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/pendingtimesheet.js"></script>
</body>
</html>