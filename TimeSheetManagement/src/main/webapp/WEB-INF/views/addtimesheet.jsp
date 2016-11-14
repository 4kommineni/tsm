<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Add TimeSheet</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/timesheet.css">
</head>
<body>
 <jsp:include page="navbar.jsp"></jsp:include>
 <div class="page-content">
  <form action="addTimesheetSubmit" method="POST" enctype="multipart/form-data">
   <div class="flex-grid no-responsive-future">
    <div class="row">
     <jsp:include page="menu.jsp"></jsp:include>
     <div id="cell-content" class="carpet cell colspan10 fg-darkBlue">
      <ul class="breadcrumbs2">
       <li><a href="home"><span class="icon mif-home"></span></a></li>
       <li><a href="#">Time Sheet</a></li>
       <li><a href="#">Add New TimeSheet</a></li>
      </ul>
      <h1 class="align-center">Add New TimeSheet</h1>
      <div class="flex-grid">
       <div class="row cell-auto-size">
        <div class="cell">
         <div class="panel margin20">
          <div class="heading">
           <span class="icon fa fa-calendar-plus-o fa-lg"></span>
           <span class="title">Add Time Sheet</span>
          </div>
          <div class="content">
           <input type="hidden" name="employee_id" value="${id}" />
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
            </div>
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
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Working Hours:</label>
              <div class="input-control text iconic full-size" data-role="input">
               <span class="fa fa-hourglass-end prepend-icon"></span>
               <input name="hours" id="hours" placeholder="Enter Working Hours" type="text" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
              </div>
             </div>
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Upload File:</label>
              <div class="input-control file full-size" data-role="input">
               <span class="mif-file-text prepend-icon"></span>
               <input type="file" name="file" id="file" placeholder="Choose File" accept="image/jpeg,image/png,application/pdf" />
               <button class="button">Browse</button>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell align-center margin20">
              <a href="addtimesheet"
               class="button rounded large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning"> <span
                class="icon mif-spinner4 mif-ani-pulse"></span> Reset
              </a>
             </div>
             <div class="cell align-center margin20">
              <a class="button rounded large-button bg-green bg-active-darkGreen fg-white block-shadow-success" href="#"
               id="getFullDetails"><span class="mif-checkmark mif-ani-heartbeat"></span>Click here</a>
             </div>
            </div>
            <br />
            <br />
           </div>
          </div>
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
              <table class="table border striped bordered hovered cell-hovered">
               <thead>
                <tr>
                 <th>Start Date</th>
                 <th>End Date</th>
                 <th>Hours</th>
                 <th>Status</th>
                 <th>Options</th>
                </tr>
               </thead>
               <tbody>
                <c:forEach var='ts' items='${alltimesheets}' varStatus='status'>
                 <tr>
                  <td>${ts.getStart_date()}</td>
                  <td>${ts.getEnd_date()}</td>
                  <td>${ts.getHours()}</td>
                  <td
                   <c:choose>
        <c:when test="${ts.getStatus()  eq 'PENDING' }">class=''</c:when>
        <c:when test="${ts.getStatus()  eq 'DECLINED' }">class='fg-red'</c:when>
        <c:otherwise>class='fg-lightOlive'</c:otherwise>
     </c:choose>>${ts.getStatus()}</td>
                  <td><a href='getUploadedFile/${ts.getTimesheet_id()}' target='_blank'> <span
                     class="mif-file-download mif-2x"></span>Client TS
                  </a></td>
                 </tr>
                 <c:if test='${status.index}==10'>
                  <c:set var='status.index' value='${alltimesheets.size}' />
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
   <div id="dialog" class="padding20 dialog" data-role="dialog" data-close-button="true" data-width="90%">
    <div data-class="container">
     <h1>Fill Hourly Sheet</h1>
     <div class="panel fg-black margin20">
      <div class="heading">
       <span class="icon fa fa-calendar-plus-o fa-lg"></span>
       <span class="title">Time Sheets</span>
      </div>
      <div class="content">
       <div class="grid">
        <div class="matter"></div>
        <div class="row">
         Note: <Strong>RT</Strong> - Regular Hours <Strong>OT</Strong> - OverTime Hours <Strong>PV</Strong> - Paid Vacation in
         Days <Strong>UV</Strong> - UnPaid Vacation in Days
         <div class="align-right">
          <button class="button rounded large-button bg-green" name="submit">Submit</button>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
    <span class="diagloge-close-button"></span>
   </div>
  </form>
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/addtimesheet.js"></script>
</body>
</html>