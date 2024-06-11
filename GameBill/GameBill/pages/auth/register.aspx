<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="GameBill.pages.auth.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="features" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Register</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item active text-white">Register</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainpostsection" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="banner" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="latestnews" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="p-5 bg-light rounded">
                <div class="row g-4">
                    <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                        <asp:Label ID="message" runat="server" Text=""></asp:Label>
                        <asp:Button ID="ButtonClose" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                    </div>
                    <div class="col-12">
                        <div class="text-center mx-auto" style="max-width: 700px;">
                            <h1 class="text-primary">Become Member of GameBill</h1>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" placeholder="Name" required></asp:TextBox>
                            <label for="LabelName" runat="server">Name</label>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                            <label for="LabelEmail" runat="server">Email</label>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required></asp:TextBox>
                            <label for="LabelPassword" runat="server">Password</label>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-5 mx-auto">
                            <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" required></asp:TextBox>
                            <label for="LabelConfirmPassword" runat="server">Confirm Password</label>
                        </div>
                        <div class="col-3 mt-5 mb-3 mx-auto">
                            <div class="d-grid">
                                <asp:LinkButton ID="LinkButtonRegister" runat="server" CssClass="btn btn-primary"><i class="bi bi-person-badge me-2"></i> Register</asp:LinkButton>
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
<asp:Content ID="Content8" ContentPlaceHolderID="mostpopulernews" runat="server">
</asp:Content>
