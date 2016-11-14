<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Education</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/education.css">
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
      <li><a href="#">Education</a></li>
     </ul>
     <h1 class="align-center">Education</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-suitcase mif-lg"></span>
          <span class="title">Resume</span>
         </div>
         <div class="content">
          <springForm:form action="educationSubmit" method="POST" commandName="education" novalidate="novalidate"
           data-role="validator" data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white"
           data-hint-color="fg-red" data-hint-easing="easeOutBounce" data-on-submit="submit">
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
             <div class="cell margin40 no-margin-top">
              <springForm:input path="employee_id" type="hidden" />
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell size3 margin40 no-margin-top">
              <label class="sub-header">University / School Name:</label>
              <div class="input-control text full-size rounded" data-role="input">
               <span class="mif-library prepend-icon fg-lightBlue"></span>
               <springForm:input path="university" data-validate-func="required"
                data-validate-hint="University Name is Required!!" data-validate-hint-position="bottom"
                placeholder="Enter your University Name here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
             <div class="cell size3 margin40 no-margin-top">
              <label class="sub-header">Degree:</label>
              <div class="input-control text full-size rounded" data-role="input">
               <span class="mif-tag prepend-icon fg-lightBlue"></span>
               <springForm:input path="degree" data-validate-func="required" data-validate-hint="Degree is Required!!"
                data-validate-hint-position="bottom" placeholder="Enter your Degree here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
            </div>
            <div class="row">
             <div class="cell size3 margin40 no-margin-top">
              <label class="sub-header">Major / Specialization:</label>
              <div class="input-control text full-size rounded" data-role="input">
               <span class="mif-bookmark prepend-icon fg-lightBlue"></span>
               <springForm:input path="specialization" data-validate-func="required"
                data-validate-hint="Specialization is Required!!" data-validate-hint-position="bottom"
                placeholder="Enter your Specialization here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
             <div class="cell size3 margin40 no-margin-top">
              <label class="sub-header">GPA:</label>
              <div class="input-control full-size rounded text" data-role="input">
               <span class="mif-star-half prepend-icon fg-lightBlue"></span>
               <springForm:input path="gpa" data-validate-func="required" data-validate-hint="GPA is Required!!"
                data-validate-hint-position="bottom" placeholder="Enter your GPA here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
             <div class="cell size3 margin40 no-margin-top">
              <label class="sub-header">Graduating Year:</label>
              <div class="input-control full-size rounded text" data-role="input">
               <span class="mif-calendar prepend-icon fg-lightBlue"></span>
               <springForm:input path="gyear" data-validate-func="required" data-validate-hint="Graduating Year is Required!!"
                data-validate-hint-position="bottom" placeholder="Enter your Graduating Year here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <button class="button helper-button clear">
                <span class="mif-cross"></span>
               </button>
              </div>
             </div>
            </div>
            <div class="row padding20">
             <div class="cell size6 align-center">
              <button class="button large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning" name="reset">
               <span class="icon mif-spinner4 mif-ani-pulse"></span>
               Reset
              </button>
             </div>
             <div class="cell size6 align-left">
              <button class="button large-button bg-green bg-active-darkGreen fg-white block-shadow-success" name="update"
               type="submit">
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
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/education.js"></script>
</body>
</html>