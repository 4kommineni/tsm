<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Change Password</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/others.css">
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
      <li><a href="#">Change Password</a></li>
     </ul>
     <h1 class="align-center">Change Password</h1>
     <div class="flex-grid">
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon mif-organization mif-lg"></span>
          <span class="title">Change Password</span>
         </div>
         <div class="content">
          <form action="changepasswordSubmit" method="POST" novalidate="novalidate" data-role="validator"
           data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
           data-hint-easing="easeOutBounce" id="cpForm" data-on-submit="submit">
           <div class="flex-grid fg-darkBlue">
            <div class="row cell-auto-size">
             <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
             <div class="cell margin40 no-margin-top">
              <input type="hidden" name="employee_id" value="${id}" />
             </div>
            </div>
            <div class="row cell-auto-size">
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">Old Password:</label>
              <div class="input-control password modern iconic full-size" data-role="input">
               <input type="password" name="user_password" id="user_password" placeholder="Old Password"
                data-validate-func="required,minlength" data-validate-arg=",6" data-validate-hint-position="bottom"
                data-validate-hint="Password is required! and must contain min 6 charecters!">
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-lock"></span>
               <button class="button helper-button reveal">
                <span class="mif-looks"></span>
               </button>
              </div>
             </div>
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">New Password:</label>
              <div class="input-control password modern iconic full-size" data-role="input">
               <input type="password" name="user_password1" id="user_password1" placeholder="New Password"
                data-validate-func="required,minlength" data-validate-arg=",6" data-validate-hint-position="bottom"
                data-validate-hint="Password is required! and must contain min 6 charecters!">
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-security"></span>
               <button class="button helper-button reveal">
                <span class="mif-looks"></span>
               </button>
              </div>
             </div>
             <div class="cell margin40 no-margin-top">
              <label class="sub-header">Re New Password:</label>
              <div class="input-control password modern iconic full-size" data-role="input">
               <input type="password" name="user_password2" id="user_password2" placeholder="Re enter New Password"
                data-validate-func="required,minlength" data-validate-arg=",6" data-validate-hint-position="bottom"
                data-validate-hint="Password is required! and must contain min 6 charecters!">
               <span class="input-state-error mif-warning"></span>
               <span class="input-state-success mif-checkmark"></span>
               <span class="icon mif-security"></span>
               <button class="button helper-button reveal">
                <span class="mif-looks"></span>
               </button>
              </div>
             </div>
            </div>
            <div class="row padding40">
             <div class="cell size6 align-center">
              <a href="home" class="button rounded large-button bg-orange bg-active-darkOrange fg-white block-shadow-warning">
               <span class="icon mif-spinner4 mif-ani-pulse"></span> Cancel
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
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/changepassword.js"></script>
</body>
</html>