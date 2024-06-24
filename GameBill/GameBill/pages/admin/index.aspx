<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Admin Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        function openModal() {
            const myModal = new bootstrap.Modal('#anothersection_ModalShow', {});
            myModal.show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Admin Dashboard</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item">Admin Dashboard</li>
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
            <div class="row g-4 justify-content-center">
                <div id="notif" runat="server" visible="false" class="col-6 mt-3 mb-3 mx-auto" role="alert">
                    <asp:Label ID="message" runat="server" Text=""></asp:Label>
                    <asp:Button ID="ButtonX" runat="server" CssClass="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                </div>
                <asp:ListView ID="ListViewGames" runat="server" OnPagePropertiesChanging="ListViewGames_PagePropertiesChanging" OnItemDeleting="ListViewGames_ItemDeleting">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Nama Game</th>
                                <th>Deskripsi</th>
                                <th>Tanggal Rilis</th>
                                <th>Developer</th>
                                <th>Publisher</th>
                                <th>Mode Game</th>
                                <th>Franchises</th>
                                <th>Perspektif Pemain</th>
                                <th>Aksi</th>
                            </tr>
                            <tr id="ItemPlaceHolder" runat="server">
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="pager" runat="server" colspan="12" class="text-center">
                                    <asp:DataPager ID="DataPagerGames" runat="server" PageSize="10" class="btn-group btn-group-sm">
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
                                <asp:Label runat="server" Text='<%#Eval("game_name") %>'></asp:Label>
                            </td>
                            <td>
                                <%#Regex.Replace(Eval("description").ToString(), "<[a-zA-Z/].*?>", String.Empty).PadRight(150).Substring(0,130).TrimEnd() %>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#String.Format("{0:dd-MMM-yyy}", Eval("release_dates")) %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("developers") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("publishers") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("game_modes") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("franchises") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("player_perspectives") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%#Eval("id") %>' OnClick="LinkButtonEdit_Click"><i class="bi bi-pencil me-2"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="delete" OnClientClick="return confirm('Are you sure, you want to delete this?')"><i class="bi bi-trash me-2"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <%--Modal Show Start--%>
    <div class="modal fade" id="ModalShow" runat="server" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelShow">Edit Detail Games</h1>
                    <asp:Button ID="ButtonIconClose" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxNamaGame" runat="server" CssClass="form-control" placeholder="Nama Game"></asp:TextBox>
                        <label for="LabelNamaGame" runat="server">Nama Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeskripsi" runat="server" CssClass="form-control" placeholder="Deskripsi"></asp:TextBox>
                        <label for="LabelDeskripsi" runat="server">Deskripsi</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxTanggalRilis" runat="server" CssClass="form-control" placeholder="Tanggal Rilis"></asp:TextBox>
                        <label for="LabelTanggalRilis" runat="server">Tanggal Rilis</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeveloper" runat="server" CssClass="form-control" placeholder="Developer"></asp:TextBox>
                        <label for="LabelDeveloper" runat="server">Developer</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPublisher" runat="server" CssClass="form-control" placeholder="Publisher"></asp:TextBox>
                        <label for="LabelPublisher" runat="server">Publisher</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxModeGame" runat="server" CssClass="form-control" placeholder="Mode Game"></asp:TextBox>
                        <label for="LabelModeGame" runat="server">Mode Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxFranchises" runat="server" CssClass="form-control" placeholder="Franchises"></asp:TextBox>
                        <label for="LabelFranchises" runat="server">Franchises</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPerspektifPemain" runat="server" CssClass="form-control" placeholder="Perspektif Pemain"></asp:TextBox>
                        <label for="LabelPerspektifPemain" runat="server">Perspektif Pemain</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxNamaGenre" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Nama Genre" ValidateRequestMode="Disabled"></asp:TextBox>
                        <label for="LabelNamaGenre" runat="server">Nama Genre</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonUpdate" runat="server" Text="Save changes" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Show End--%>
</asp:Content>
