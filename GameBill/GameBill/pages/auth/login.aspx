<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GameBill.pages.auth.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Login</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item">Login</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="features" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gamessection" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="bg-light rounded p-5">
                <div class="row g-4">
                    <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                        <asp:Label ID="message" runat="server" Text=""></asp:Label>
                        <asp:Button ID="ButtonX" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                    </div>
                    <div class="col-12">
                        <div class="text-center mx-auto" style="max-width: 700px;">
                            <h1 class="text-primary">Access more on GameBill</h1>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating col-5 mt-3 mb-3 mx-auto">
                            <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="form-control" placeholder="User Name" required=""></asp:TextBox>
                            <label for="TextBoxUserName" runat="server">User Name</label>
                        </div>
                        <div class="form-floating col-5 mt-3 mb-5 mx-auto">
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required=""></asp:TextBox>
                            <label for="TextBoxPassword" runat="server">Password</label>
                        </div>
                        <div class="col-3 mt-5 mb-3 mx-auto">
                            <div class="d-grid">
                                <asp:LinkButton ID="LinkButtonLogin" runat="server" CssClass="btn btn-primary" OnClick="LinkButtonLogin_Click"><i class="bi bi-box-arrow-in-right me-2"></i> Login</asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-3 mt-3 mb-3 mx-auto">
                            <p>Or You Don't Have Account?</p>
                        </div>
                        <div class="col-3 mt-3 mx-auto">
                            <div class="d-grid">
                                <asp:HyperLink ID="HyperLinkRegister" runat="server" CssClass="btn btn-secondary" NavigateUrl="~/pages/auth/register.aspx"><i class="bi bi-person-badge me-2"></i> Register</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
