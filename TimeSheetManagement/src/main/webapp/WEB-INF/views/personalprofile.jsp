<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Personal Profile</title>
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
						<li><a href="#">Personal Profile</a></li>
					</ul>
					<h1 class="align-center">Personal Profile</h1>
					<br />
					<springForm:form action="personalProfileSubmit" method="POST" commandName="personalprofile" data-role="validator"
						data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white" data-hint-color="fg-red"
						data-hint-easing="easeOutBounce">
						<div class="flex-grid">
							<div class="row cell-auto-size">
								<div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
								<springForm:input type="hidden" path="employee_id" />
							</div>
							<div class="row cell-auto-size">
								<div class="flex-grid">
									<div class="row cell-auto-size">
										<div class="cell margin40 no-margin-top">
											<h3>
												<span class="icon mif-pin mif-2x"></span>
												Temporary Address:
											</h3>
										</div>
									</div>
									<div class="row cell-auto-size">
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Apartment No:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-location-city prepend-icon fg-lightBlue"></span>
												<springForm:input path="apt1" placeholder="Enter your Appartment Number here.." data-validate-func="required"
													data-validate-hint="Appartment Number is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">City:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-location prepend-icon fg-lightBlue"></span>
												<springForm:input path="city1" placeholder="Enter your City here.." data-validate-func="required"
													data-validate-hint="City Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">State:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="state1" placeholder="Enter your State here.." data-validate-func="required"
													data-validate-hint="State Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
									</div>
									<div class="row cell-auto-size">
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Country:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="country1" placeholder="Enter your Country here.." data-validate-func="required"
													data-validate-hint="Country Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Zip Code:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-paper-plane prepend-icon fg-lightBlue"></span>
												<springForm:input path="zipcode1" placeholder="Enter your Zipcode here.."
													data-validate-func="required, number, minlength, maxlength" data-validate-hint="6 digits only!!"
													data-validate-arg=",,6,6" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Home Phone:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-phone mif-ani-ring prepend-icon fg-lightBlue"></span>
												<springForm:input path="home_phone1" placeholder="Enter your Phone No here.." data-validate-func="required"
													data-validate-hint="Phone No is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
											<springForm:errors path="home_phone1" id="home_phone_error1" cssClass="error" />
										</div>
									</div>
								</div>
							</div>
							<div class="row cell-auto-size">
								<div class="flex-grid">
									<div class="row cell-auto-size">
										<div class="cell size3 margin40 no-margin-top">
											<h3>
												<span class="icon mif-pin mif-2x"></span>
												Permanent Address:
											</h3>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<div class="full-size">
												<label class="sub-header">Copy address: </label> <label class="input-control radio fg-lightBlue"> <input type="radio"
													name="copyAdrs" <c:if test="${personal.getCopyAdrs()=='Yes'}">checked</c:if> value="Yes" /> <span class="check"></span>
													<span class="caption">Yes</span>
												</label> <label class="input-control radio"> <input type="radio" name="copyAdrs"
													<c:if test="${personalprofile.getCopyAdrs()=='No'}">checked</c:if> value="No" /> <span class="check"></span> <span
														class="caption">No</span>
												</label>
											</div>
										</div>
									</div>
									<div class="row cell-auto-size">
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Apartment No:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-location-city prepend-icon fg-lightBlue"></span>
												<springForm:input path="apt2" placeholder="Enter your Appartment Number here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">City:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-location prepend-icon fg-lightBlue"></span>
												<springForm:input path="city2" placeholder="Enter your City here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">State:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="state2" placeholder="Enter your State here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
									</div>
									<div class="row cell-auto-size">
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Country:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="country2" placeholder="Enter your Country here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Zip Code:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-paper-plane prepend-icon fg-lightBlue"></span>
												<springForm:input path="zipcode2" placeholder="Enter your Zipcode here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
										<div class="cell size3 margin40 no-margin-top">
											<label class="sub-header">Home Phone:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-phone mif-ani-ring prepend-icon fg-lightBlue"></span>
												<springForm:input path="home_phone2" placeholder="Enter your Phone No here.." />
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
										</div>
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
		<jsp:include page="footer.jsp" />
	</div>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="resources/Metro-UI/build/js/metro.min.js"></script>
	<script type="text/javascript" src="resources/js/notifyMsgs.js"></script>
	<script type="text/javascript" src="resources/js/personalprofile.js"></script>
</body>
</html>