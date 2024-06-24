<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.main.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="<%=ResolveUrl("~/assets/js/IGDB.js")%>"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="features" runat="server">
    <div class="container-fluid">
        <div class="container py-3">
            <div class="row g-3">
                <div class="col-10">
                    <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></li>
                            <li data-bs-target="#carouselId" data-bs-slide-to="1"></li>
                            <li data-bs-target="#carouselId" data-bs-slide-to="2"></li>
                            <li data-bs-target="#carouselId" data-bs-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%=ResolveUrl("~/assets/img/Cyberpunk2077_1.png")%>" class="img-fluid w-100 h-100 rounded" alt="Image">
                                <div class="carousel-caption">
                                    <div class="p-3">
                                        <h1 class="display-6 text-capitalize text-primary mb-4">Cyberpunk 2077</h1>
                                        <p class="mb-5 fs-5">
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        </p>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <a class="btn-hover-bg btn btn-primary rounded-pill text-white py-3 px-5" href="#">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="<%=ResolveUrl("~/assets/img/ResidentEvil4_1.jfif")%>" class="img-fluid w-100 h-100 rounded" alt="Image">
                                <div class="carousel-caption">
                                    <div class="p-3">
                                        <h1 class="display-6 text-capitalize text-primary mb-4">Resident Evil 4</h1>
                                        <p class="mb-5 fs-5">
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        </p>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <a class="btn-hover-bg btn btn-primary rounded-pill text-white py-3 px-5" href="#">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="<%=ResolveUrl("~/assets/img/AlanWake2_1.jfif")%>" class="img-fluid w-100 h-100 rounded" alt="Image">
                                <div class="carousel-caption">
                                    <div class="p-3">
                                        <h1 class="display-6 text-capitalize text-primary mb-4">Alan Wake II</h1>
                                        <p class="mb-5 fs-5">
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        </p>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <a class="btn-hover-bg btn btn-primary rounded-pill text-white py-3 px-5" href="#">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="<%=ResolveUrl("~/assets/img/MarvelsSpiderMan2_1.jfif")%>" class="img-fluid w-100 h-100 rounded" alt="Image">
                                <div class="carousel-caption">
                                    <div class="p-3" style="max-width: 5000px;">
                                        <h1 class="display-6 text-capitalize text-primary mb-4">Marvel's Spider-Man 2</h1>
                                        <p class="mb-5 fs-5">
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                        </p>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <a class="btn-hover-bg btn btn-primary rounded-pill text-white py-3 px-5" href="#">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="row g-2">
                        <div class="col-6">
                            <img src="<%=ResolveUrl("~/assets/img/Cyberpunk2077_1.png")%>" class="img-fluid w-100 h-100 rounded" alt="Image">
                        </div>
                        <div class="col-6">
                            <p class="mb-4">Alan Wake II</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="gamessection" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="anothersection" runat="server">
</asp:Content>
