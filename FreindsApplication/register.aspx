<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="FreindsApplication.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
							<form method="POST" class="needs-validation" runat="server" novalidate="">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="name">Name</label>
									<input id="name" type="text" class="form-control" value="" runat="server" required autofocus>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator"
										ControlToValidate="name"
										ErrorMessage="Please enter a Name."
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								   <asp:RegularExpressionValidator
										ID="RegularExpressionValidator"
										ControlToValidate="name"
										ErrorMessage="Name can only consist of alphabets and space"
										Display="Dynamic"
									    ValidationExpression="[a-zA-Z ]*$"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="phone">Phone Number</label>
									<input id="phone" type="tel" maxlength="10" class="form-control" runat="server" value="" required>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator1"
										ControlToValidate="phone"
										ErrorMessage="Please enter phone number"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								   <asp:RegularExpressionValidator
										ID="RegularExpressionValidator1"
										ControlToValidate="phone"
										ErrorMessage="Please enter a valid 10 digit phone number"
									    ValidationExpression="[0-9]{10}$"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="password">Password</label>
									<input id="password" type="password" class="form-control" name="password" runat="server" required>
								    <asp:RequiredFieldValidator
										ID="RequiredFieldValidator2"
										ControlToValidate="password"
										ErrorMessage="Please enter a password.<br />"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="confpassword">Confirm Password</label>
									<input id="confpassword" type="password" class="form-control" name="confpassword" runat="server" required>
								    <asp:RequiredFieldValidator
										ID="RequiredFieldValidator3"
										ControlToValidate="confpassword"
										ErrorMessage="Re-enter password"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								   <asp:CompareValidator
										ID="CompareValidator5"
										ControlToValidate="confpassword"
									    ControlToCompare="password"
									    operator="Equal"
										ErrorMessage="Passwords do not match"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<p class="form-text text-muted mb-3">
									By registering you agree with our terms and condition.
								</p>

								<div class="align-items-center d-flex">
									<button id="submitRegister" type="button" onserverclick="submitRegister_Click" runat="server" class="btn btn-primary ms-auto">
										Register
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Already have an account? <a href="Login.aspx" class="text-dark">Login</a>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">
						Copyright &copy; 2021 &mdash; Friends Application
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
