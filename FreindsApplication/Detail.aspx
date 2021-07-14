<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="FreindsApplication.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Friend's Detail</title>
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
							<h1 class="fs-4 card-title fw-bold mb-4">Friend Detail</h1>
							<form method="POST" class="needs-validation" runat="server" novalidate="">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="fname">First Name</label>
									<input id="fname" onchange="fname.value = e.target.value" type="text" class="form-control" value="" runat="server" required autofocus disabled>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator"
										ControlToValidate="fname"
										ErrorMessage="Please enter First Name."
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								    <asp:RegularExpressionValidator
										ID="RegularExpressionValidator"
										ControlToValidate="fname"
										ErrorMessage="Name can only consist of alphabets"
										Display="Dynamic"
									    ValidationExpression="[a-zA-Z]*$"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="lname">Last Name</label>
									<input id="lname" type="text" class="form-control" value="" runat="server" required autofocus disabled>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator1"
										ControlToValidate="lname"
										ErrorMessage="Please enter Last Name."
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								    <asp:RegularExpressionValidator
										ID="RegularExpressionValidator1"
										ControlToValidate="lname"
										ErrorMessage="Name can only consist of alphabets"
										Display="Dynamic"
									    ValidationExpression="[a-zA-Z]*$"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="phone">Phone Number</label>
									<input id="phone" type="tel" maxlength="10" class="form-control" runat="server" value="" required disabled>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator2"
										ControlToValidate="phone"
										ErrorMessage="Please enter phone number"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								   <asp:RegularExpressionValidator
										ID="RegularExpressionValidator2"
										ControlToValidate="phone"
										ErrorMessage="Please enter a valid 10 digit phone number"
									    ValidationExpression="[0-9]{10}$"
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">Email ID</label>
									<input id="email" type="text" class="form-control" value="" runat="server" required autofocus disabled>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator3"
										ControlToValidate="email"
										ErrorMessage="Please enter Email ID."
										Display="Dynamic"
										runat="server"
										CssClass="invalid-feedback"/>

								    <asp:RegularExpressionValidator
										ID="RegularExpressionValidator3"
										ControlToValidate="email"
										ErrorMessage="Incorrect Email ID."
										Display="Dynamic"
									    ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
										runat="server"
										CssClass="invalid-feedback"/>
								</div>

								<div class="align-items-center d-flex">
									<button type="submit" id="editDelete" runat="server" onServerClick="deleteFriend_Click" class="btn btn-primary ms-auto">
										Delete Friend
									</button>
									<asp:Button ID="edit" runat="server" Text="Edit Friend Detail" CssClass="btn btn-primary ms-auto" OnClick="editFriend_Click" />
									<asp:Button ID="clear" runat="server" Text="Cancel" CssClass="btn btn-primary ms-auto" OnClick="editClear_Click" Visible="False" />
									<button type="submit" id="editSubmit" runat="server" onServerClick="editSubmit_Click" class="btn btn-primary ms-auto">
										Submit
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								<a href="Dashboard.aspx" class="text-dark">View Friends</a>
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