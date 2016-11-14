<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Home</title>
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-icons.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-colors.min.css">
<link rel="stylesheet" href="resources/Metro-UI/build/css/metro-schemes.min.css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
 <div class="tile-area bg-lightBlue fg-white">
  <h1 class="tile-area-title">Welcome to TSM</h1>
  <div class="tile-area-controls">
   <!-- bg-grayDark bg-transparent fg-white bg-hover-dark -->
   <button class="image-button icon-right no-border">
    <span class="sub-header no-margin text-light">Hello! ${name}</span>
    <span class="icon mif-user"></span>
   </button>
   <span data-role="hint" data-hint-mode="2" data-hint="Change Password" data-hint-background="bg-blue" data-hint-color="fg-white">
    <a href="changepassword" class="square-button bg-transparent fg-white bg-grayDark bg-hover-dark no-border"><span class="mif-loop2"></span></a>
   </span>
   <span data-role="hint" data-hint-mode="2" data-hint="Logout" data-hint-background="bg-red" data-hint-color="fg-white">
    <a href="logout" class="square-button bg-transparent fg-white bg-grayDark bg-hover-dark no-border"><span
      class="mif-switch"></span></a>
   </span>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Profiles</span>
   <div class="tile-container">
    <div class="tile-wide ol-dark" data-role="tile">
     <div class="tile-content slide-left-2">
      <div class="slide image-container image-format-hd" style="width: 100%;">
       <img src="resources/images/home/generalProfile.jpg">
      </div>
      <div class="slide-over bg-violet padding10">
       <div class="tile-content iconic">
        <h4>
         <a href="generalProfile" class="fg-white"> <i class="icon fa fa-pencil-square-o fa-lg" aria-hidden="true"></i> <span
           class="tile-label">General Profile</span>
         </a>
        </h4>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="tile">
     <div class="tile-content slide-left-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/personalProfile.ico" data-role="fitImage" data-format="square">
      </div>
      <div class="slide-over bg-violet padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="personalProfile" class="fg-white"> <span class="icon mif-user mif-lg"></span> <span class="tile-label">Personal
           Profile</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-left-2">
      <div class="slide image-container image-format-saquare" style="width: 100%;">
       <img src="resources/images/home/clientProfile.jpg" data-role="fitImage" data-format="square">
      </div>
      <div class="slide-over bg-violet padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="clientProfile" class="fg-white"> <span class="icon mif-suitcase mif-lg"></span> <span class="tile-label">
           Client Profile</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Time Sheets</span>
   <div class="tile-container">
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-hd" style="width: 100%;">
       <img src="resources/images/home/addTimesheet.jpg">
      </div>
      <div class="slide-over bg-indigo padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="addtimesheet" class="fg-white"> <i class="icon fa fa-calendar-plus-o fa-lg" aria-hidden="true"></i> <span
           class="tile-label"> Add Time Sheet</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/pendingTimesheet.png">
      </div>
      <div class="slide-over bg-indigo padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="pendingtimesheet" class="fg-white"> <i class="icon fa fa-calendar-o fa-lg" aria-hidden="true"></i> <span
           class="tile-label"> Pending Time Sheet</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/approvedTimesheet.jpg">
      </div>
      <div class="slide-over bg-indigo padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="approvedtimesheet" class="fg-white"> <span class="icon mif-event-available mif-lg"></span> <span
           class="tile-label"> Approved Time Sheet</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/viewTime.jpg">
      </div>
      <div class="slide-over bg-indigo padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="searchtimesheet" class="fg-white"> <span class="icon mif-search mif-lg"></span> <span class="tile-label">
           Time Sheet Hours</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Education</span>
   <div class="tile-container">
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/Education.jpg">
      </div>
      <div class="slide-over bg-orange padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="education" class="fg-white"> <span class="icon mif-school mif-lg"></span> <span class="tile-label">
           Education</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-up-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/skills.png">
      </div>
      <div class="slide-over bg-orange padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="skills" class="fg-white"> <span class="icon mif-medal mif-lg"></span> <span class="tile-label">
           Skills</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-down-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/resume.jpg">
      </div>
      <div class="slide-over bg-amber padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="resume" class="fg-white"> <span class="icon mif-file-pdf mif-lg"></span> <span class="tile-label">
           Resume</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-down-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/documents.png">
      </div>
      <div class="slide-over bg-amber padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="documents" class="fg-white"> <span class="icon mif-files-empty mif-lg"></span> <span class="tile-label">
           Documents</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Immigration</span>
   <div class="tile-container">
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-left-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/immigrationFaq.jpg">
      </div>
      <div class="slide-over bg-blue padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="immigration_faq" class="fg-white"><span class="icon mif-bubbles mif-lg"></span> <span class="tile-label">
           Immigration FAQ's</span> </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-right-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/immigration.jpg">
      </div>
      <div class="slide-over bg-blue padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="immigration" class="fg-white"> <span class="icon mif-earth mif-lg"></span> <span class="tile-label">
           Immigration</span>
         </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Others</span>
   <div class="tile-container">
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-left-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/payStubs.jpg">
      </div>
      <div class="slide-over bg-blue padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="paystubs" class="fg-white"><span class="icon mif-tags mif-lg"></span> <span class="tile-label"> Pay
           Stubs</span> </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
    <div class="tile ol-dark" data-role="title">
     <div class="tile-content slide-right-2">
      <div class="slide image-container image-format-square" style="width: 100%;">
       <img src="resources/images/home/dependents.png">
      </div>
      <div class="slide-over bg-blue padding10">
       <div class="tile-content iconic">
        <h5>
         <a href="dependents" class="fg-white"><span class="icon mif-organization mif-lg"></span> <span class="tile-label">
           Dependents</span> </a>
        </h5>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="tile-group double">
   <span class="tile-group-title">Emergency Contact</span>
   <div class="tile-container">
    <div class="tile-wide ol-dark bg-magenta fg-white" data-role="tile">
     <div class="tile-content iconic">
      <a href="emergencycontact" class="fg-white"> <span class="icon mif-contacts-dialer"></span> <span class="tile-label">Emergency
        Contact</span>
      </a>
     </div>
    </div>
   </div>
  </div>
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
 <script type="text/javascript" src="resources/js/home.js"></script>
</body>
</html>