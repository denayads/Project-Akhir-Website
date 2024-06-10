<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.main.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="<%=ResolveUrl("~/assets/js/IGDB.js")%>"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hero" runat="server">
    <div class="container-fluid py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-md-12 col-lg-7">
                    <h4 class="mb-3 text-secondary">Featured & Recommended</h4>
                    <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active rounded">
                                <div id="JsonCPHHero" class="row g-4"></div>
                                <img src="#" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="featuressection" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gameshop" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="features" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="anothergameshop" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="bannersection" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="bestseller" runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="fact" runat="server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="testimonial" runat="server">
</asp:Content>
