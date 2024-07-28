<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="GameBill.pages.auth.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Register</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item">Register</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="features" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gamessection" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="bg-light rounded p-5">
                <div class="row g-4">
                    <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                        <asp:Label ID="message" runat="server" Text=""></asp:Label>
                        <asp:Button ID="ButtonX" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                    </div>
                    <div class="col-12">
                        <div class="text-center mx-auto" style="max-width: 700px;">
                            <h1 class="text-primary">Become Member of GameBill</h1>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="form-control" placeholder="User Name" required></asp:TextBox>
                            <label for="TextBoxUserName" runat="server">User Name</label>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Fill user name!" ControlToValidate="TextBoxUserName" CssClass="ms-3 invalid"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                            <label for="TextBoxEmail" runat="server">Email</label>
                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Email wrong!" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="mb-3 invalid"></asp:RegularExpressionValidator>--%>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required></asp:TextBox>
                            <label for="TextBoxPassword" runat="server">Password</label>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-5 mx-auto">
                            <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" required></asp:TextBox>
                            <label for="TextBoxConfirmPassword" runat="server">Confirm Password</label>
                            <%--<asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Password and confirm password not same!" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" Operator="Equal" Type="String" CssClass="ms-3 invalid"></asp:CompareValidator>--%>
                        </div>
                        <div class="col-3 mt-5 mb-3 mx-auto">
                            <div class="d-grid">
                                <asp:LinkButton ID="LinkButtonRegister" runat="server" CssClass="btn btn-primary" OnClick="LinkButtonRegister_Click"><i class="bi bi-person-badge me-2"></i> Register</asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-3 mt-3 mb-3 mx-auto">
                            <p>Or You Already Have Account?</p>
                        </div>
                        <div class="col-3 mt-3 mx-auto">
                            <div class="d-grid">
                                <asp:HyperLink ID="HyperLinkLogin" runat="server" CssClass="btn btn-secondary" NavigateUrl="~/pages/auth/login.aspx"><i class="bi bi-box-arrow-in-right me-2"></i> Login</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
