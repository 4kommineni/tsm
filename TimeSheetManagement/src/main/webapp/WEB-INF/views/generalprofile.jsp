<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="resources/css/profile.css">
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
      <li><a href="#">Profiles</a></li>
      <li><a href="#">General Profile</a></li>
     </ul>
     <h1 class="align-center">General Profile</h1>
     <br />
     <springForm:form action="generalProfileSubmit" method="POST" commandName="generalprofile" enctype="multipart/form-data"
      novalidate="novalidate" data-role="validator" data-show-required-state="false" data-hint-mode="hint"
      data-hint-background="bg-white" data-hint-color="fg-red" data-hint-easing="easeOutBounce" data-on-submit="submit">
      <div class="flex-grid">
       <div class="row cell-auto-size">
        <div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
       </div>
       <div class="row cell-auto-size">
        <div class="cell margin40 no-margin-top">
         <label class="sub-header">Employee ID:</label>
         <div class="input-control text rounded" data-role="input">
          <span class="mif-tag prepend-icon fg-lightBlue"></span>
          <springForm:input path="employee_id" disabled="true" />
         </div>
        </div>
       </div>
       <div class="row cell-auto-size">
        <div class="cell margin40 no-margin-top">
         <label class="sub-header">First Name:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-user prepend-icon fg-lightBlue"></span>
          <springForm:input path="first_name" data-validate-func="required" data-validate-hint="First Name is Required!!"
           data-validate-hint-position="bottom" placeholder="Enter your First Name here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell margin40 no-margin-top">
         <label class="sub-header">Middle Name:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-user prepend-icon fg-lightBlue"></span>
          <springForm:input path="middle_name" placeholder="Enter your Middle Name here.." />
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell margin40 no-margin-top">
         <label class="sub-header">Last Name:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-user prepend-icon fg-lightBlue"></span>
          <springForm:input path="last_name" data-validate-func="required" data-validate-hint="Last Name is Required!!"
           data-validate-hint-position="bottom" placeholder="Enter your Last Name here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
       </div>
       <div class="row">
        <div class="cell size4 margin40 no-margin-top">
         <label class="sub-header">Primary Email:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-envelop prepend-icon fg-lightBlue"></span>
          <springForm:input path="primary_email" data-validate-func="required,email"
           data-validate-hint="Primary Email Id is Required!!" data-validate-hint-position="bottom"
           placeholder="Enter your Primary Email here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell size4 margin40 no-margin-top">
         <label class="sub-header">Secondary Email:</label>
         <div class="input-control full-size rounded text" data-role="input">
          <span class="mif-envelop prepend-icon fg-lightBlue"></span>
          <springForm:input path="secondary_email" data-validate-func="required,email"
           data-validate-hint="Secondary Email Id is Required!!" data-validate-hint-position="bottom"
           placeholder="Enter your Secondary Email here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
       </div>
       <div class="row">
        <div class="cell size4 margin40 no-margin-top">
         <label class="sub-header">Mobile Phone:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-mobile prepend-icon fg-lightBlue"></span>
          <springForm:input path="mobile_phone" data-validate-func="required" data-validate-hint="Mobile Phone is Required!!"
           data-validate-hint-position="bottom" placeholder="Enter your Mobile number here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
         <springForm:errors path="mobile_phone" id="mobile_phone_error" cssClass="error" />
        </div>
        <div class="cell size4 margin40 no-margin-top">
         <label class="sub-header">Work Phone:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-mobile prepend-icon fg-lightBlue"></span>
          <springForm:input path="work_phone" data-validate-func="required" data-validate-hint="Work Phone is Required!!"
           data-validate-hint-position="bottom" placeholder="Enter your work number here.." />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
         <springForm:errors path="work_phone" id="work_phone_error" cssClass="error" />
        </div>
       </div>
       <div class="row">
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">Date of Birth:</label>
         <div class="input-control text full-size rounded" data-role="input" id="datepicker_dob" data-date="08/01/2016"
          data-format="mm/dd/yyyy">
          <span class="mif-calendar prepend-icon fg-lightBlue"></span>
          <springForm:input path="date_of_birth" readonly="readonly" onclick="dob()" data-validate-func="required"
           data-validate-hint="Date of Birth is Required!!" data-validate-hint-position="bottom"
           placeholder="Select Date of Birth" />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">SSN:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-security prepend-icon fg-lightBlue"></span>
          <springForm:input path="ssn" placeholder="Enter your SSN here.." data-validate-func="required"
           data-validate-hint="SSN is Required!!" data-validate-hint-position="bottom" />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">DL Number:</label>
         <div class="input-control text full-size rounded" data-role="input">
          <span class="mif-drive-eta prepend-icon fg-lightBlue"></span>
          <springForm:input path="dl_number" placeholder="Enter DL Number" data-validate-func="required"
           data-validate-hint="DL Number field Empty!!" data-validate-hint-position="bottom" />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">License Expiry:</label>
         <div class="input-control text full-size rounded" data-role="input" id="datepicker_le" data-format="mm/dd/yyyy">
          <span class="mif-calendar prepend-icon fg-lightBlue"></span>
          <springForm:input path="license_expiry" readonly="readonly" onclick="le()" data-validate-func="required"
           data-validate-hint="License expiry field Empty!!" data-validate-hint-position="bottom"
           placeholder="Select License Expiry" />
          <span class="input-state-error mif-warning"></span>
          <span class="input-state-success mif-checkmark"></span>
          <button class="button helper-button clear">
           <span class="mif-cross"></span>
          </button>
         </div>
        </div>
       </div>
       <div class="row">
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">Gender:</label>
         <div class="full-size">
          <label class="input-control radio"> <input type="radio" name="gender"
           <c:if test="${generalprofile.getGender()=='Male'}">checked</c:if> value="Male" /> <span class="check"></span> <span
            class="caption">Male</span>
          </label> <label class="input-control radio"> <input type="radio" name="gender"
           <c:if test="${generalprofile.getGender()=='Female'}">checked</c:if> value="Female" /> <span class="check"></span> <span
            class="caption">Female</span>
          </label>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">Marital Status:</label>
         <div class="input-control select full-size">
          <springForm:select path="marital_status">
           <option <c:if test="${generalprofile.getMarital_status()=='Single'}">selected="true"</c:if>>Single</option>
           <option <c:if test="${generalprofile.getMarital_status()=='Married'}">selected="true"</c:if>>Married</option>
          </springForm:select>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">Current Status:</label>
         <div class="input-control select full-size">
          <springForm:select path="current_status">
           <option <c:if test="${generalprofile.getCurrent_status()=='Active'}">selected="true"</c:if>>Active</option>
           <option <c:if test="${generalprofile.getCurrent_status()=='In Active'}">selected="true"</c:if>>In Active</option>
          </springForm:select>
         </div>
        </div>
        <div class="cell size2 margin40 no-margin-top">
         <label class="sub-header">Employee Type:</label>
         <div class="input-control select full-size">
          <springForm:select path="employee_type">
           <option <c:if test="${generalprofile.getEmployee_type()=='Employee'}">selected="true"</c:if>>Employee</option>
           <option <c:if test="${generalprofile.getEmployee_type()=='Non Employee'}">selected="true"</c:if>>Non Employee</option>>
											<option <c:if test="${generalprofile.getEmployee_type()=='Contract'}">selected="true"</c:if>>Contract</option>>
										</springForm:select>
         </div>
        </div>
       </div>
       <div class="row">
        <div class="cell size4 margin40 no-margin-top">
         <h4>
          <span class="mif-file-picture"></span>
          Upload Image:
         </h4>
         <div class="image-container image-format-hd" style="max-width: 100px; max-height: 100px;">
          <img alt="My Image" src="/timesheet/GPImage">
         </div>
        </div>
        <div class="cell size4 margin40 no-margin-top">
         <label class="sub-header">Your Photo:</label>
         <div class="input-control file full-size rounded" data-role="input">
          <springForm:input path="image" id="gpImage" type="file" accept="image/*" />
          <button class="button">
           <span>Browse</span>
          </button>
         </div>
         <div class="cell error" id="imageError">${imageError}</div>
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
  <jsp:include page="footer.jsp"></jsp:include>
 </div>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
 <script type="text/javascript" src="resources/js/generalprofile.js"></script>
</body>
</html>