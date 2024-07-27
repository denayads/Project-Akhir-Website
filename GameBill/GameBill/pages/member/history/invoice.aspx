<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="GameBill.pages.member.history.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Invoice</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        function openModal() {
            const myModal = new bootstrap.Modal('#anothersection_ModalImage', {});
            myModal.show();
        }
    </script>
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
                                <th>Bukti Pembayaran</th>
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
                                <div class="col-5">
                                    <div class="game-item">
                                        <div class="game-img">
                                            <div class="game-img-inner">
                                                <asp:Image ID="ImagePayment" runat="server" CssClass="img-fluid w-100 rounded-top" ImageUrl='<%#(String.IsNullOrEmpty(Eval ("img_location").ToString())) ? "~/assets/img/No_Image_Available.jpg" : "~/" + Eval("img_location")%>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton ID="LinkButtonImage" runat="server" CommandArgument='<%#Eval("id_order")%>' OnClick="LinkButtonImage_Click"><i class="bi bi-pencil"></i></asp:LinkButton>
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

    <%--Modal Image Start--%>
    <div class="modal fade" id="ModalImage" runat="server" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelImage">Upload Image</h1>
                    <asp:Button ID="ButtonIconCloseImage" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <asp:Image ID="ImagePayment" runat="server" CssClass="img-fluid w-100 rounded-top" ImageUrl='<%#(String.IsNullOrEmpty(Eval ("img_location").ToString())) ? "~/assets/img/No_Image_Available.jpg" : "~/" + Eval("img_location")%>' />
                    <div class="mt-3 mb-3">
                        <label for="FileUploadImage" class="form-label">Input your payment image(.png or .jpg)</label>
                        <asp:FileUpload ID="FileUploadImage" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonCloseImage" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonUpdateImage" runat="server" Text="Save changes" CssClass="btn btn-primary" OnClick="ButtonUpdateImage_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Image End--%>
</asp:Content>
