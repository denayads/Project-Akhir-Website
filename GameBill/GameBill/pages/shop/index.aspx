<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.shop.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Shop</title>
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
    <div class="container-fluid game py-5">
        <div class="container py-5">
            <div class="row g-4 justify-content-center">
                <asp:ListView ID="ListViewGames" runat="server" OnPagePropertiesChanging="ListViewGames_PagePropertiesChanging">
                    <LayoutTemplate>
                        <div id="ItemPlaceHolder" runat="server">
                        </div>
                        <div id="pager" runat="server">
                            <asp:DataPager ID="DataPagerGames" runat="server" PageSize="6" class="btn-group btn-group-sm">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Link" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="game-item">
                                <div class="game-img">
                                    <div class="game-img-inner">
                                        <asp:Image ID="ImageGame" runat="server" CssClass="img-fluid w-100 rounded-top" ImageUrl='<%#(String.IsNullOrEmpty(Eval("img_location").ToString())) ? "~/assets/img/No_Image_Available.jpg" : "~/" + Eval("img_location") %>' />
                                        <div class="game-icon">
                                            <asp:HyperLink ID="HyperLinkGambar" runat="server" CssClass="my-auto" NavigateUrl="#"><i class="fas fa-link fa-2x text-white"></i></asp:HyperLink>
                                        </div>
                                    </div>
                                    <div class="game-info d-flex align-items-center border border-start-0 border-end-0">
                                        <asp:HyperLink ID="HyperLinkNamaGame" runat="server" CssClass="flex-fill text-center text-white border-end py-2"><i class="bi bi-person-badge me-2"></i> Posted By: <%#Eval ("game_name") %></asp:HyperLink>
                                        <small class="flex-fill text-center border-end py-2"><i class="bi bi-calendar4-week me-2"></i><%#String.Format("{0:dd/MMM/yyyy}", Eval ("release_dates")) %></small>
                                    </div>
                                </div>
                                <div class="game-content border border-top-0 rounded-bottom p-4">
                                    <asp:HyperLink ID="HyperLinkJudul" runat="server" CssClass="h4"> <%#Eval ("game_name") %></asp:HyperLink>
                                    <p class="my-3"><%#Regex.Replace(Eval ("description").ToString(), "<[a-zA-Z/].*?>", String.Empty).PadRight(100).Substring(0,80).TrimEnd() %></p>
                                    <asp:HyperLink ID="HyperLinkReadMore" runat="server" CssClass="btn btn-primary rounded-pill py-2 px-4" NavigateUrl='<%#Eval ("id", "~/pages/blog/show.aspx?id={0}") %>'>Read More</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
</asp:Content>
