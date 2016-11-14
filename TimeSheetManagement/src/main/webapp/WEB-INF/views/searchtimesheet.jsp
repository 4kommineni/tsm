<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Search in TimeSheets</title>
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
      <li><a href="#">Search in TimeSheets</a></li>
     </ul>
     <h1 class="align-center">Search in TimeSheets</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-plus-o fa-lg"></span>
          <span class="title">Search in Time Sheets</span>
         </div>
         <form action="searchTimesheetSubmit" method="POST" id="searchForm" novalidate="novalidate" data-role="validator"
          data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
          data-hint-easing="easeOutBounce" data-on-submit="submit">
          <div class="content">
           <input type="hidden" name="employee_id" value="${id}" />
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Start Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_s" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <input type="text" name="start_date" id="start_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="Start Date is Required!!" data-validate-hint-position="bottom" placeholder="Enter Start Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">End Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_e" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <input type="text" name="end_date" id="end_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="End Date is Required!!" data-validate-hint-position="bottom" placeholder="Enter End Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell align-center margin20">
              <a href="searchtimesheet"
               class="button rounded large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning"> <span
                class="icon mif-cross"></span> Cancel
              </a>
             </div>
             <div class="cell align-center margin20">
              <button id="search" class="button rounded large-button bg-green bg-active-darkGreen fg-white block-shadow-success">
               <span class="mif-search"></span>
               Search
              </button>
             </div>
            </div>
           </div>
          </div>
         </form>
        </div>
       </div>
      </div>
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-plus-o fa-lg"></span>
          <span class="title">Time Sheets</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <h4>Name: ${name}</h4>
             <h4>
              Total :
              <c:if test="${total >0}"> ${total} hours</c:if>
             </h4>
            </div>
           </div>
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <h5>
              Regular Time :
              <c:if test="${trt >0}"> ${trt} hours</c:if>
             </h5>
             <h5>
              Over Time :
              <c:if test="${tot >0}"> ${tot} hours</c:if>
             </h5>
            </div>
            <div class="cell margin20 no-margin-top">
             <h5>
              Paid Vacations :
              <c:if test="${tpv >0}"> ${tpv} days</c:if>
             </h5>
             <h5>
              Unpaid Vacations :
              <c:if test="${tuv >0}"> ${tuv} days</c:if>
             </h5>
            </div>
           </div>
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <table id="searchTable" class="table border bordered striped hovered cell-hovered">
              <thead>
               <tr>
                <th>Date</th>
                <th>Regular Time</th>
                <th>Paid Time</th>
                <th>Paid Vacation</th>
                <th>Unpaid Vacation</th>
                <th>Status</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='ts' items='${searchedtimesheets}'>
                <tr>
                 <td>${ts.getDate()}</td>
                 <td>${ts.getRt()}</td>
                 <td>${ts.getOt()}</td>
                 <td>${ts.getPv()}</td>
                 <td>${ts.getUv()}</td>
                 <td
                  <c:choose>
        <c:when test="${ts.getStatus()  eq 'PENDING' }">class=''</c:when>
        <c:when test="${ts.getStatus()  eq 'DECLINED' }">class='fg-red'</c:when>
        <c:otherwise>class='fg-lightOlive'</c:otherwise>
     </c:choose>>${ts.getStatus()}</td>
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
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/searchtimesheet.js"></script>
</body>
</html>