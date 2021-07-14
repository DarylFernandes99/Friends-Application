<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FreindsApplication.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container-fluid text-center" runat="server">
            <h2>Dashboard</h2>
            <asp:Button ID="Logout" runat="server" Text="Logout" Font-Size="Small" OnClick="Logout_Click"/>
            <br /><br />
            <div class="row d-flex justify-content-center">
                <div class="col-1">
                    <a href="Create.aspx" class="text-dark">Create Friend</a>
                </div>
                <div class="col-1">
                    <asp:Button ID="Delete" runat="server" Text="Delete" Font-Size="Small" OnClick="Delete_Click"/>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:friendsConnectionString %>" SelectCommand="SELECT [id], [fname], [lname] FROM [friends_list] WHERE ([userID] = @userID) ORDER BY [fname]">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

            <div class="row d-flex justify-content-center">
                <div class="col-1">
                    <asp:Button ID="CheckAll" runat="server" Text="Check All" Font-Size="Small" OnClick="CheckAll_Click"/>
                </div>
                <div class="col-1">
                    <asp:Button ID="UncheckAll" runat="server" Text="Uncheck All" Font-Size="Small" OnClick="UncheckAll_Click"/>
                </div>
            </div>
            <br />
            
            <asp:GridView ID="GridView1" DataKeyNames="id,fname,lname" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Detail" runat="server" Text="View" Font-Size="Small" OnClick="Detail_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
    </form>
</asp:Content>