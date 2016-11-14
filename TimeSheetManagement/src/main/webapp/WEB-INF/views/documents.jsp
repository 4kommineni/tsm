<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Documents</title>
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
      <li><a href="#">Documents</a></li>
     </ul>
     <h1 class="align-center">Documents</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-files-empty mif-lg"></span>
          <span class="title">Current Skills</span>
         </div>
         <div class="content">
          <form action="documentsSubmit" method="POST" enctype="multipart/form-data" novalidate="novalidate" data-role="validator"
           data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
           data-hint-easing="easeOutBounce" id="documentForm" data-on-submit="submit">
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
             <div class="cell margin40 no-margin-top">
              <input type="hidden" name="employee_id" value="${id}" />
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">Document Title:</label>
              <div class="input-control text modern full-size iconic" data-role="input">
               <input type="text" name="title" data-validate-func="required" data-validate-hint="Title is Required!!"
                data-validate-hint-position="bottom" placeholder="Enter your Document Title here.." />
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-library"></span>
              </div>
             </div>
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">Expiry Date:</label>
              <div class="input-control text modern iconic full-size" id="datepicker" data-format="mm/dd/yyyy">
               <input type="text" name="exp_date" id="exp_date" readonly="readonly" placeholder="Enter Exp Date" />
               <span class="icon mif-calendar"></span>
              </div>
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin40 no-margin-top no-margin-bottom">
              <label class="sub-header">Upload File:</label>
              <div class="input-control file full-size" data-role="input">
               <span class="mif-file-text prepend-icon"></span>
               <input type="file" name="file" id="file" placeholder="Choose File" accept="application/pdf" />
               <button class="button">Browse</button>
              </div>
             </div>
            </div>
            <div class="row padding20">
             <div class="cell size6 align-center">
              <a href="documents" class="button rounded large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning">
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
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-files-empty mif-lg"></span>
          <span class="title">Saved Documents</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <table id="documentsTable" class="table striped border bordered hovered cell-hovered">
              <thead>
               <tr>
                <th>Title</th>
                <th>Upload Date</th>
                <th>Expiry Date</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='d' items='${documents}'>
                <tr>
                 <td><a href='getUploadedDocument/${d.getTitle()}' target='_blank'><span class="mif-download"></span> ${d.getTitle()}</a>
                 </td>
                 <td>${d.getUpload_date()}</td>
                 <td>${d.getExp_date()}</td>
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
 <jsp:include page="footer.jsp" />
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/documents.js"></script>
</body>
</html>