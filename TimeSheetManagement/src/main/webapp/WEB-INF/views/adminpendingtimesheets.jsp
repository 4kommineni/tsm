<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Pending Timesheets</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
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
     <h1 class="align-center">Admin Page</h1>
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
            <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
           </div>
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <form action="adminPendingTS" method="post">
              <table id="PendingTable" class="table border bordered striped hovered cell-hovered align-center">
               <thead>
                <tr>
                 <th>S. No.</th>
                 <th>Employee Name</th>
                 <th>Start Date</th>
                 <th>End Date</th>
                 <th>Hours</th>
                 <th>Client TS</th>
                 <th>Approve</th>
                 <th>Deny</th>
               <tbody>
                <c:forEach var='ts' items='${pendingtimesheets}' varStatus="item">
                 <tr>
                  <td>${item.count}</td>
                  <c:forEach var='p' items='${allprofiles}' varStatus="i">
                   <c:if test="${p.getId() eq ts.getEmployee_id()}">
                    <td>${p.getName()}</td>
                    <c:set var="i.index" value="${items.size}" />
                   </c:if>
                  </c:forEach>
                  <td>${ts.getStart_date()}</td>
                  <td>${ts.getEnd_date()}</td>
                  <td>${ts.getHours()}</td>
                  <td><a href='getAdminUploadedFile/${ts.getTimesheet_id()}' target='_blank'> <span
                     class="mif-file-download"></span> Client TS
                  </a></td>
                  <td><button type="submit" name="task" value="APPROVED-${ts.getTimesheet_id()}"
                    class="button cycle-button success">
                    <span class="mif-checkmark"></span>
                   </button></td>
                  <td><button type="submit" name="task" value="DECLINED-${ts.getTimesheet_id()}"
                    class="button cycle-button danger">
                    <span class="mif-cross"></span>
                   </button></td>
                 </tr>
                </c:forEach>
               </tbody>
              </table>
             </form>
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
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/adminpendingtimesheets.js"></script>
</body>
</html>