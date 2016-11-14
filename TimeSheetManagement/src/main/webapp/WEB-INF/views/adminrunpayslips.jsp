<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM -Admin - Run Payslips</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="resources/css/admin.css">
</head>
<body class="fullheight">
 <jsp:include page="adminnavbar.jsp" />
 <div class="page-content fullheight">
  <div class="flex-grid no-responsive-future fullheight">
   <div class="row fullheight">
    <jsp:include page="adminmenu.jsp" />
    <div id="cell-content" class="carpet cell colspan10 fg-lightBlue fullheight">
     <h1 class="align-center">Run Pay Slips</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-plus-o fa-lg"></span>
          <span class="title">Time Sheets</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <form action="adminSearchTS" method="POST" id="adminSearchForm" novalidate="novalidate" data-role="validator"
            data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
            data-hint-easing="easeOutBounce" data-on-submit="submit">
            <div class="row cell-auto-size">
             <div class="cell margin20">
              <!-- <label class="sub-header">Start Date:</label>  -->
              <div class="input-control text modern iconic full-size" id="datepicker_s" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <input type="text" name="start_date" id="start_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="Start Date is Required!!" data-validate-hint-position="bottom" placeholder="Enter Start Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
             <div class="cell margin20">
              <!-- <label class="sub-header">End Date:</label>  -->
              <div class="input-control text modern iconic full-size" id="datepicker_e" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <input type="text" name="end_date" id="end_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="End Date is Required!!" data-validate-hint-position="bottom" placeholder="Enter End Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
             <div class="cell margin20">
              <button id="search" class="button rounded bg-green bg-active-darkGreen fg-white">
               <span class="mif-search"></span>
               Search
              </button>
             </div>
            </div>
           </form>
           <div class="row cell-auto-size">
            <div class="cell margin20">
            <form action="adminPay" method="post">
            <input type="hidden" name="start_date1" value="${s_date}" />
            <input type="hidden" name="end_date1" value="${e_date}" />
             <table id="adminSearchTable" class="table border bordered striped hovered cell-hovered">
              <thead>
               <tr>
                <th>S.No.</th>
                <th>Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Total Time</th>
                <th>Pay</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='ts' items='${searchedtimesheets}' varStatus="i">
                <tr>
                 <td>${i.count}</td>
                 <td>${ts.getName()}</td>
                 <td>${ts.getStart_date()}</td>
                 <td>${ts.getEnd_date()}</td>
                 <td>${ts.getTotal()}</td>
                 <td><button type="submit" name="pay" value="${ts.getEmployee_id()}::${ts.getStart_date()}::${ts.getEnd_date()}" class="button primary">Pay</button></td>
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
 <script type="text/javascript" src="resources/js/adminrunpayslips.js"></script>
</body>
</html>