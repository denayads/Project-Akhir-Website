﻿<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="GameBill.pages.member.history.invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Invoice</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Invoice</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/member/index.aspx")%>">My Dashboard</a></li>
            <li class="breadcrumb-item">Invoice</li>
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
                <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                    <asp:Label ID="message" runat="server" Text=""></asp:Label>
                    <asp:Button ID="ButtonX" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                </div>
                <asp:ListView ID="ListViewInvoice" runat="server" OnPagePropertiesChanging="ListViewInvoice_PagePropertiesChanging">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Nomer</th>
                                <th>Tanggal Pembelian</th>
                                <th>Nama Game</th>
                                <th>Harga</th>
                                <th>Status</th>
                            </tr>
                            <tr id="ItemPlaceHolder" runat="server">
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="pager" runat="server" colspan="12" class="text-center">
                                    <asp:DataPager ID="DataPagerInvoice" runat="server" PageSize="10" class="btn-group btn-group-sm">
                                        <Fields>
                                            <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="|<" ShowPreviousPageButton="true" ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary disabled" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                                            <asp:NextPreviousPagerField NextPageText=">" LastPageText=">|" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false" ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr class="TableData">
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("id_order")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#String.Format("{0:dd-MMM-yyy}", Eval("dates"))%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("game_name")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#String.Format("{0:n0}", Eval("prices"))%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("status")%>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
