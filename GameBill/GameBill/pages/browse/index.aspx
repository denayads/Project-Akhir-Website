<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.browse.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Browse</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="features" runat="server">
    <div class="container-fluid game py-3">
        <div class="container py-3">
            <div class="input-group w-100 mx-auto d-flex mb-4">
                <asp:TextBox ID="TextBoxSearch" runat="server" TextMode="Search" CssClass="form-control p-3" placeholder="Search your games here..."></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="btn btn-primary input-group-text p-3" OnClick="ButtonSearch_Click" />
            </div>
            <div class="row g-3 justify-content-center">
                <div class="col-5">
                    <p>Genre :</p>
                    <asp:RadioButtonList ID="RadioButtonListGenre" runat="server" CssClass="form-check mt-3 mb-3"></asp:RadioButtonList>
                </div>
                <div class="col-6">
                    <p>Platform :</p>
                    <asp:RadioButtonList ID="RadioButtonListPlatform" runat="server" CssClass="form-check mt-3 mb-3"></asp:RadioButtonList>
                </div>
                <div class="col-1">
                    <asp:Button ID="ButtonFilter" runat="server" Text="Filter" CssClass="btn btn-primary py-3" OnClick="ButtonFilter_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gamessection" runat="server">
    <div class="container-fluid game py-5">
        <div class="container py-5">
            <div class="row g-4 justify-content-center">
                <asp:ListView ID="ListViewGames" runat="server" OnPagePropertiesChanging="ListViewGames_PagePropertiesChanging">
                    <LayoutTemplate>
                        <div id="ItemPlaceHolder" runat="server">
                        </div>
                        <div id="pager" runat="server" class="text-center">
                            <asp:DataPager ID="DataPagerGames" runat="server" PageSize="10" class="btn-group btn-group-sm">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Link" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <asp:HyperLink ID="HyperLinkGame" runat="server" NavigateUrl='<%#Eval("id", "~/pages/browse/show.aspx?id={0}")%>'>
                                <div class="game-item">
                                    <div class="game-img">
                                        <div class="game-img-inner">
                                            <asp:Image ID="ImageGame" runat="server" CssClass="img-fluid w-100 rounded-top" ImageUrl='<%#(String.IsNullOrEmpty(Eval ("img_location").ToString())) ? "~/assets/img/No_Image_Available.jpg" : "~/" + Eval("img_location")%>' />
                                        </div>
                                    </div>
                                    <div class="game-content border border-top-0 rounded-bottom p-4">
                                        <p class="h4"><%#Eval("game_name")%></p>
                                    </div>
                                </div>
                            </asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
</asp:Content>
