<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Immigration</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/immigration.css">
</head>
<body>
 <jsp:include page="navbar.jsp" />
 <div class="page-content">
  <div class="flex-grid no-responsive-future">
   <div class="row">
    <jsp:include page="menu.jsp" />
    <div id="cell-content" class="carpet cell colspan10 fg-lightBlue">
     <ul class="breadcrumbs2">
      <li><a href="home"><span class="icon mif-home"></span></a></li>
      <li><a href="#">Education</a></li>
      <li><a href="#">Immigration</a></li>
     </ul>
     <h1 class="align-center">Immigration</h1>
     <br />
     <div class="flex-grid">
      <div class="row cell-auto-size flex-just-center">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-earth mif-lg"></span>
          <span class="title">Immigration</span>
         </div>
         <div class="content">
          <springForm:form action="immigrationSubmit" method="POST" commandName="immigration" novalidate="novalidate"
           data-role="validator" data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white"
           data-hint-color="fg-red" data-hint-easing="easeOutBounce" id="iForm" data-on-submit="submit">
           <springForm:input type="hidden" path="employee_id" />
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Work Permit:</label>
              <div class="input-control modern select iconic full-size">
               <springForm:select path="work_permit">
                <option <c:if test="${immigration.getWork_permit()=='CPT'}">selected="true"</c:if>>CPT</option>
                <option <c:if test="${immigration.getWork_permit()=='OPT'}">selected="true"</c:if>>OPT</option>
                <option <c:if test="${immigration.getWork_permit()=='H1B'}">selected="true"</c:if>>H1B</option>
                <option <c:if test="${immigration.getWork_permit()=='GC'}">selected="true"</c:if>>GC</option>
                <option <c:if test="${immigration.getWork_permit()=='US Citizen'}">selected="true"</c:if>>US Citizen</option>
                <option <c:if test="${immigration.getWork_permit()=='H4 EAD'}">selected="true"</c:if>>H4 EAD</option>
               </springForm:select>
               <span class="icon mif-user-check"></span>
              </div>
             </div>
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Start Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_s" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <springForm:input path="start_date" readonly="readonly" data-validate-func="required"
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
               <springForm:input path="end_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="End Date is Required!!" data-validate-hint-position="bottom" placeholder="Enter End Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Passport Number:</label>
              <div class="input-control text modern full-size iconic" data-role="input">
               <springForm:input path="passport_number" placeholder="Enter Passport Number here.." data-validate-func="required"
                data-validate-hint="Passport Number Required!!" data-validate-hint-position="bottom" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-security"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Passport Issue Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_pi" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <springForm:input path="p_issue_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="Start Date is Required!!" data-validate-hint-position="bottom"
                placeholder="Passport Issue Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Passport Expiry Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_pe" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <springForm:input path="p_exp_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="Passport Exp. is Required!!" data-validate-hint-position="bottom"
                placeholder="Passport Exp. Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">Entered Us First Time:</label>
              <div class="input-control text modern iconic full-size" id="datepicker_ue" data-date="08/01/2016"
               data-format="mm/dd/yyyy">
               <springForm:input path="us_entry_date" readonly="readonly" data-validate-func="required"
                data-validate-hint="US Entry Date is Required!!" data-validate-hint-position="bottom" placeholder="US Entry Date" />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-calendar"></span>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">I-9 Status:</label>
              <div class="input-control modern select iconic full-size">
               <springForm:select path="l9_status">
                <option <c:if test="${immigration.getL9_status()=='Submitted'}">selected="true"</c:if>>Submitted</option>
                <option <c:if test="${immigration.getL9_status()=='Not Submitted'}">selected="true"</c:if>>Not Submitted</option>
               </springForm:select>
               <span class="icon mif-power"></span>
              </div>
             </div>
             <div class="cell margin20 no-margin-bottom">
              <label class="sub-header">W4 Status:</label>
              <div class="input-control modern select iconic full-size">
               <springForm:select path="w4_status">
                <option <c:if test="${immigration.getW4_status()=='Submitted'}">selected="true"</c:if>>Submitted</option>
                <option <c:if test="${immigration.getW4_status()=='Not Submitted'}">selected="true"</c:if>>Not Submitted</option>
               </springForm:select>
               <span class="icon mif-power"></span>
              </div>
             </div>
            </div>
            <div class="row padding20">
             <div class="cell size6 align-center">
              <a href="immigration" class="button large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning">
               <span class="icon mif-spinner4 mif-ani-pulse"></span> Reset
              </a>
             </div>
             <div class="cell size6 align-left">
              <button class="button large-button bg-green bg-active-darkGreen fg-white block-shadow-success" name="update">
               <span class="mif-checkmark mif-ani-heartbeat"></span>
               Submit
              </button>
             </div>
            </div>
           </div>
          </springForm:form>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
 <jsp:include page="footer.jsp" />
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/immigration.js"></script>
</body>
</html>