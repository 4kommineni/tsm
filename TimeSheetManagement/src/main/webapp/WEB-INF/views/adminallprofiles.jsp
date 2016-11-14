<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - General Profile</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
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
     <h1 class="align-center">All Profiles</h1>
     <div class="flex-grid">
      <div class="row flex-just-end">
       <div class="cell size4">
        <a id="addNewUser" href="#" class="command-button bg-teal fg-white"> <span class="icon mif-user-plus"></span> Add New
         User <small>Use this button to add new User</small>
        </a>
       </div>
      </div>
      <div class="row cell-auto-size">
       <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
      </div>
      <div class="row cell-auto-size">
       <div class="cell">
        <div class="panel margin20">
         <div class="heading">
          <span class="icon fa fa-calendar-o fa-lg"></span>
          <span class="title">All Profiles</span>
         </div>
         <div class="content">
          <div class="flex-grid fg-darkBlue">
           <div class="row cell-auto-size">
            <div class="cell margin20 no-margin-top">
             <table id="adminAllProfilesTable" class="table border bordered striped hovered cell-hovered">
              <thead>
               <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Date of birth</th>
                <th>SSN</th>
                <th>Address</th>
               </tr>
              </thead>
              <tbody>
               <c:forEach var='p' items='${allprofiles}'>
                <tr>
                 <th>${p.getName()}</th>
                 <th>${p.getEmail()}</th>
                 <th>${p.getPhone()}</th>
                 <th>${p.getDob()}</th>
                 <th>${p.getSsn()}</th>
                 <th>${p.getAddress()}</th>
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
      <div id="dialog" class="padding20 dialog bg-lightBlue fg-white" data-role="dialog" data-close-button="true" data-width="60%"
       data-type="info">
       <div data-class="container">
        <h1>New User Details</h1>
        <form action="addnewuser" method="post" novalidate="novalidate" data-role="validator" data-show-required-state="false"
         data-hint-mode="line" data-hint-background="bg-white" data-hint-color="fg-red" data-hint-easing="easeOutBounce"
         data-on-submit="submit">
         <div class="flex-grid">
          <div class="row cell-auto-size">
           <div class="cell margin20">
            <label class="sub-header">Employee_Id:</label>
            <div class="input-control text iconic full-size" data-role="input">
             <span class="fa fa-hourglass-end prepend-icon"></span>
             <input name="user_id" id="user_id" placeholder="Enter Employee Id" type="text" data-validate-func="required"
              data-validate-hint="Employee Id is Required!!" data-validate-hint-position="bottom" value="${newuserid}" />
             <span class="input-state-error mif-warning"></span>
             <span class="input-state-success mif-checkmark"></span>
             <button class="button helper-button clear">
              <span class="mif-cross"></span>
             </button>
            </div>
           </div>
          </div>
          <div class="row cell-auto-size">
           <div class="cell margin20">
            <label class="sub-header">Email Id:</label>
            <div class="input-control text iconic full-size" data-role="input">
             <span class="fa fa-hourglass-end prepend-icon"></span>
             <input name="email" id="email" placeholder="Enter email" type="email" data-validate-func="required"
              data-validate-hint="Email id is Required!!" data-validate-hint-position="bottom" />
             <span class="input-state-error mif-warning"></span>
             <span class="input-state-success mif-checkmark"></span>
             <button class="button helper-button clear">
              <span class="mif-cross"></span>
             </button>
            </div>
           </div>
           <div class="cell margin20">
            <label class="sub-header">Password</label>
            <div class="input-control text iconic full-size" data-role="input">
             <span class="fa fa-hourglass-end prepend-icon"></span>
             <input name="password" id="password" placeholder="Enter password" type="text" data-validate-func="required"
              data-validate-hint="Password is Required!!" data-validate-hint-position="bottom" value="temp123$" />
             <span class="input-state-error mif-warning"></span>
             <span class="input-state-success mif-checkmark"></span>
             <button class="button helper-button clear">
              <span class="mif-cross"></span>
             </button>
            </div>
           </div>
          </div>
          <div class="row cell-auto-size">
           <div class="cell margin20">
            <label class="sub-header">First Name:</label>
            <div class="input-control text iconic full-size" data-role="input">
             <span class="fa fa-hourglass-end prepend-icon"></span>
             <input name="first_name" id="first_name" type="text" data-validate-func="required"
              data-validate-hint="First Name is Required!!" data-validate-hint-position="bottom"
              placeholder="Enter your First Name here.." />
             <span class="input-state-error mif-warning"></span>
             <span class="input-state-success mif-checkmark"></span>
             <button class="button helper-button clear">
              <span class="mif-cross"></span>
             </button>
            </div>
           </div>
           <div class="cell margin20">
            <label class="sub-header">Last Name:</label>
            <div class="input-control text iconic full-size" data-role="input">
             <span class="fa fa-hourglass-end prepend-icon"></span>
             <input name="last_name" id="last_name" placeholder="Enter Last Name here.." type="text" data-validate-func="required"
              data-validate-hint="Last Name is Required!!" data-validate-hint-position="bottom" />
             <span class="input-state-error mif-warning"></span>
             <span class="input-state-success mif-checkmark"></span>
             <button class="button helper-button clear">
              <span class="mif-cross"></span>
             </button>
            </div>
           </div>
          </div>
          <div class="flex-just-end">
           <button class="button rounded large-button bg-green" name="submit">Submit</button>
          </div>
         </div>
        </form>
       </div>
       <span class="diagloge-close-button"></span>
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
 <script type="text/javascript" src="resources/js/adminallprofiles.js"></script>
</body>
</html>