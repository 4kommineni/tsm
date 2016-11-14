<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Resume</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
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
      <li><a href="#">Resume</a></li>
     </ul>
     <h1 class="align-center">Resume</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-file-pdf mif-lg"></span>
          <span class="title">Resume</span>
         </div>
         <div class="content">
          <form action="resumeSubmit" method="POST" enctype="multipart/form-data" novalidate="novalidate" data-role="validator"
           data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
           data-hint-easing="easeOutBounce" id="resumeForm" data-on-submit="submit">
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
             <div class="cell margin40 no-margin-top">
              <input type="hidden" name="employee_id" value="${resume.getEmployee_id()}" />
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin40 no-margin-top no-margin-bottom">
              <label class="sub-header">Title:</label>
              <div class="input-control text full-size rounded" data-role="input">
               <span class="mif-library prepend-icon fg-lightBlue"></span>
               <input type="text" name="title" data-validate-func="required" data-validate-hint="Title is Required!!"
                data-validate-hint-position="bottom" placeholder="Enter your Document Title here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
              </div>
             </div>
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">Upload File:</label>
              <div class="input-control file full-size" data-role="input">
               <span class="mif-file-text prepend-icon fg-lightBlue"></span>
               <input type="file" name="file" id="file" placeholder="Choose File" accept="application/pdf" />
               <button class="button">Browse</button>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin40 no-margin-top no-margin-bottom">
              <c:if test="${not empty resume.getTitle()}">
               <a href='getResume' target='_blank'> <span class="mif-download mif-ani-vertical mif-2x"></span> Download
                Resume
               </a>
              </c:if>
             </div>
            </div>
            <div class="row padding20">
             <div class="cell size6 align-center">
              <a href="resume" class="button rounded large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning">
               <span class="icon mif-spinner4 mif-ani-pulse"></span> Reset
              </a>
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
 <jsp:include page="footer.jsp" />
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/resume.js"></script>
</body>
</html>