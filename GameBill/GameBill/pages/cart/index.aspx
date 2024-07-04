<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.cart.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Cart</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Cart</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/browse/index.aspx")%>">Browse</a></li>
            <li class="breadcrumb-item">Cart</li>
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
            <div class="row g-3 justify-content-center">
                <div class="col-10">
                    <asp:ListView ID="ListViewCart" runat="server">
                        <LayoutTemplate>
                            <table class="table">
                                <tr>
                                    <th>Nama Game</th>
                                    <th>Harga</th>
                                </tr>
                                <tr id="ItemPlaceHolder" runat="server">
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr class="TableData">
                                <td>
                                    <asp:Label runat="server" Text='<%#Eval("game_name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" Text='<%#String.Format("{0:n0}", Eval("prices")) %>'></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="col-2">
                    <asp:LinkButton ID="LinkButtonCheckout" runat="server" CssClass="btn btn-primary w-100 py-3">Checkout</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
