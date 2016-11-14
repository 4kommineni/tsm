<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='shortcut icon' type='image/x-icon' href='resources/images/fav.ico' />
<title>TSM - Client Profile</title>
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
						<li><a href="#">Client Profile</a></li>
					</ul>
					<h1 class="align-center">Client Profile</h1>
					<br />
					<springForm:form action="clientProfileSubmit" method="POST" commandName="clientprofile" novalidate="novalidate"
						data-role="validator" data-show-required-state="false" data-hint-mode="hint" data-hint-background="bg-white"
						data-hint-color="fg-red" data-hint-easing="easeOutBounce" data-on-submit="submit">
						<div class="flex-grid">
							<div class="row cell-auto-size">
								<div class="cell fg-red sub-alt-header align-center capital" id="updateMsg">${updateMsg}</div>
							</div>
							<div class="row cell-auto-size">
								<div class="cell size4 margin40 no-margin-top">
									<springForm:input path="employee_id" type="hidden" />
									<label class="sub-header">Client Name:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-tag prepend-icon fg-lightBlue"></span>
										<springForm:input path="client_name" placeholder="Enter Clinet Name here.." data-validate-func="required"
											data-validate-hint="client Name Required!!" data-validate-hint-position="bottom" />
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
									<h3>
										<span class="icon mif-pin mif-2x"></span>
										Address:
									</h3>
									<div class="input-control textarea full-size" data-role="input" data-text-auto-resize="true" data-text-max-height="150">
										<springForm:textarea path="address" placeholder="Address" />
									</div>
								</div>
								<div class="cell margin40 no-margin-top">
									<br /> <br />
									<div class="row cell-auto-size">
										<div class="cell size4 margin10">
											<label class="sub-header">City:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-location prepend-icon fg-lightBlue"></span>
												<springForm:input path="city" placeholder="Enter your City here.." data-validate-func="required"
													data-validate-hint="City Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
											<springForm:errors path="city" cssClass="error" />
										</div>
										<div class="cell size4 margin10">
											<label class="sub-header">State:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="state" placeholder="Enter your State here.." data-validate-func="required"
													data-validate-hint="State Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
											<springForm:errors path="state" cssClass="error" />
										</div>
									</div>
									<div class="row cell-auto-size">
										<div class="cell size4 margin10">
											<label class="sub-header">Country:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-earth prepend-icon fg-lightBlue"></span>
												<springForm:input path="country" placeholder="Enter your Country here.." data-validate-func="required"
													data-validate-hint="Country Name is Required!!" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
											<springForm:errors path="country" cssClass="error" />
										</div>
										<div class="cell size4 margin10">
											<label class="sub-header">Zip Code:</label>
											<div class="input-control text full-size rounded" data-role="input">
												<span class="mif-paper-plane prepend-icon fg-lightBlue"></span>
												<springForm:input path="zipcode" placeholder="Enter your Zipcode here.."
													data-validate-func="required, number, minlength, maxlength" data-validate-hint="6 digits only!!"
													data-validate-arg=",,6,6" data-validate-hint-position="bottom" />
												<span class="input-state-error mif-warning"></span>
												<span class="input-state-success mif-checkmark"></span>
												<button class="button helper-button clear">
													<span class="mif-cross"></span>
												</button>
											</div>
											<springForm:errors path="zipcode" cssClass="error" />
										</div>
									</div>
								</div>
							</div>
							<div class="row cell-auto-size">
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Position/Title:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-power prepend-icon fg-lightBlue"></span>
										<springForm:input path="position" placeholder="Enter your position here.." data-validate-func="required"
											data-validate-hint="Title is Required!!" data-validate-hint-position="bottom" />
										<span class="input-state-error mif-warning"></span>
										<span class="input-state-success mif-checkmark"></span>
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
								</div>
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Work Email:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-envelop prepend-icon fg-lightBlue"></span>
										<springForm:input path="work_email" placeholder="Enter Work Email here.." data-validate-func="email"
											data-validate-hint="Work Email is Required!!" data-validate-hint-position="bottom" />
										<span class="input-state-error mif-warning"></span>
										<span class="input-state-success mif-checkmark"></span>
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
								</div>
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Desk Phone:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-phone prepend-icon fg-lightBlue"></span>
										<springForm:input path="desk_phone" placeholder="Enter Desk Phone No here.." />
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
									<springForm:errors path="desk_phone" id="desk_phone_error" cssClass="error" />
								</div>
							</div>
							<div class="row cell-auto-size">
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Supervisor Name:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-user prepend-icon fg-lightBlue"></span>
										<springForm:input path="supervisor_name" placeholder="Enter Supervisor Name here.." data-validate-func="required"
											data-validate-hint="Supervisor Name is Required!!" data-validate-hint-position="bottom" />
										<span class="input-state-error mif-warning"></span>
										<span class="input-state-success mif-checkmark"></span>
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
								</div>
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Supervisor Email:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-envelop prepend-icon fg-lightBlue"></span>
										<springForm:input path="supervisor_email" placeholder="Enter Supervisor Email here.." data-validate-func="email"
											data-validate-hint="Supervisor Email is Required!!" data-validate-hint-position="bottom" />
										<span class="input-state-error mif-warning"></span>
										<span class="input-state-success mif-checkmark"></span>
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
								</div>
								<div class="cell margin40 no-margin-top">
									<label class="sub-header">Supervisor Phone:</label>
									<div class="input-control text full-size rounded" data-role="input">
										<span class="mif-phone prepend-icon fg-lightBlue"></span>
										<springForm:input path="supervisor_phone" placeholder="Enter Supervisor Phone here.." />
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
									<springForm:errors path="supervisor_phone" id="supervisor_phone_error" cssClass="error" />
								</div>
							</div>
							<div class="row cell-auto-size">
								<div class="cell size4 margin40 no-margin-top">
									<label class="sub-header">Start Date:</label>
									<div class="input-control text full-size rounded" data-role="input" id="datepicker" data-format="mm/dd/yyyy">
										<span class="mif-calendar prepend-icon fg-lightBlue"></span>
										<springForm:input path="start_date" placeholder="Select Start Date" readonly="readonly" onclick="openDate()"
											data-validate-func="required" data-validate-hint="Start Date Required!!" data-validate-hint-position="bottom" />
										<span class="input-state-error mif-warning"></span>
										<span class="input-state-success mif-checkmark"></span>
										<button class="button helper-button clear">
											<span class="mif-cross"></span>
										</button>
									</div>
								</div>
								<div class="cell size4 margin40 no-margin-top">
									<label class="sub-header">Employee Status:</label>
									<div class="input-control select full-size">
										<springForm:select path="employment_status">
											<option <c:if test="${clientprofile.getEmployment_status()=='CPT'}">selected="true"</c:if>>CPT</option>
											<option <c:if test="${clientprofile.getEmployment_status()=='OPT'}">selected="true"</c:if>>OPT</option>>
											<option <c:if test="${clientprofile.getEmployment_status()=='H1B'}">selected="true"</c:if>>H1B</option>
											<option <c:if test="${clientprofile.getEmployment_status()=='GC'}">selected="true"</c:if>>GC</option>>
											<option <c:if test="${clientprofile.getEmployment_status()=='US Citizen'}">selected="true"</c:if>>US Citizen</option>
											<option <c:if test="${clientprofile.getEmployment_status()=='H4 EAD'}">selected="true"</c:if>>H4 EAD</option>>
										</springForm:select>
									</div>
								</div>
								<div class="cell size4 margin40 no-margin-top"></div>
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
	<script type="text/javascript" src="resources/js/clientprofile.js"></script>
</body>
</html>