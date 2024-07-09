﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="show.aspx.cs" Inherits="GameBill.pages.browse.show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Detail of <%=title%></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="features" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gamessection" runat="server">
    <div class="container-fluid py-3">
        <div class="container py-3">
            <div class="row g-3">
                <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                    <asp:Label ID="message" runat="server" Text=""></asp:Label>
                    <asp:Button ID="ButtonX" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                </div>
                <div class="col-10">
                    <div class="form-floating mt-3 mb-3">
                        <asp:Label ID="LabelNamaGame" runat="server" CssClass="h2" Text=""></asp:Label>
                    </div>
                    <div class="form-floating mt-3 mb-3 ps-3 border border-1 border-top-0 border-end-0 border-bottom-0">
                        <asp:Label ID="LabelNamaGenre" runat="server" Text="Genres:"></asp:Label>
                        <asp:ListView ID="ListViewGenre" runat="server">
                            <ItemTemplate>
                                <p><%#Eval("genre_name")%></p>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:Label ID="LabelDeskripsi" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-2">
                    <asp:LinkButton ID="LinkButtonBuy" runat="server" CssClass="btn btn-primary w-100 py-3" OnClick="LinkButtonBuy_Click">Buy Now</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
</asp:Content>
