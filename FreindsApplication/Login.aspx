<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FreindsApplication.Login" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
</asp:Content>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
							<form method="POST" runat="server" class="needs-validation" novalidate="">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="phone">Phone Number</label>
									<input id="phone" type="tel" class="form-control" runat="server" maxlength="10" name="phone" value="" required autofocus>
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
									<div class="mb-2 w-100">
										<label class="text-muted" for="password">Password</label>
									</div>
									<input id="password" type="password" class="form-control" runat="server" name="password" required>
								    <asp:RequiredFieldValidator
										ID="RequiredFieldValidator2"
										ControlToValidate="password"
										ErrorMessage="Please enter a password.<br />"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="d-flex align-items-center">
									<button type="submit" runat="server" id="submitLogin" onserverclick="submitLogin_Click" class="btn btn-primary ms-auto">
										Login
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Don't have an account? <a href="register.aspx" class="text-dark">Create One</a>
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
	<script src="js/login.js"></script>
</asp:Content>