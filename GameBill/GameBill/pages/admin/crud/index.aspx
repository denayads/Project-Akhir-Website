<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.admin.crud.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Create, Update, Delete Game</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        function openModal() {
            const myModal = new bootstrap.Modal('#anothersection_ModalShow', {});
            myModal.show();
        }
        function openModalGenre() {
            const myModal = new bootstrap.Modal('#anothersection_ModalGenre', {});
            myModal.show();
        }
        function openModalPlatform() {
            const myModal = new bootstrap.Modal('#anothersection_ModalPlatform', {});
            myModal.show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" runat="server">
    <div class="container-fluid page-header py-5">
        <h1 class="text-center display-6">Admin Dashboard</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/main/index.aspx")%>">Home</a></li>
            <li class="breadcrumb-item"><a href="<%=ResolveUrl("~/pages/admin/index.aspx")%>">Admin Dashboard</a></li>
            <li class="breadcrumb-item">Create, Update, Delete Game</li>
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
                <p class="mb-0">
                    To create games detail click<asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#" data-bs-toggle="modal" data-bs-target="#anothersection_ModalCreate"> here.</asp:HyperLink>
                </p>
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
                                <th>Harga</th>
                                <th>Genre</th>
                                <th>Platform</th>
                                <th>Administrator</th>
                                <th>Tool</th>
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
                                <asp:Label runat="server" Text='<%#Eval("game_name")%>'></asp:Label>
                            </td>
                            <td>
                                <%#Regex.Replace(Eval("description").ToString(), "<[a-zA-Z/].*?>", String.Empty).PadRight(150).Substring(0,130).TrimEnd()%>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#String.Format("{0:dd-MMM-yyy}", Eval("release_dates"))%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("developers")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("publishers")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("game_modes")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("franchises")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("player_perspectives")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#String.Format("{0:n0}", Eval("prices"))%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("genre_name")%>'></asp:Label>
                                <asp:LinkButton ID="LinkButtonGenre" runat="server" CommandArgument='<%#Eval("id")%>' OnClick="LinkButtonGenre_Click" data-bs-toggle="modal" data-bs-target="#anothersection_ModalGenre"><i class="bi bi-pencil"></i></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("platforms_name")%>'></asp:Label>
                                <asp:LinkButton ID="LinkButtonPlatform" runat="server" CommandArgument='<%#Eval("id")%>' OnClick="LinkButtonPlatform_Click" data-bs-toggle="modal" data-bs-target="#anothersection_ModalPlatform"><i class="bi bi-pencil"></i></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%#Eval("user_name")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%#Eval("id")%>' OnClick="LinkButtonEdit_Click" data-bs-toggle="modal" data-bs-target="#anothersection_ModalShow"><i class="bi bi-pencil"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%#Eval("id")%>' OnClientClick="return confirm('Are you sure, you want to delete this?')" OnClick="LinkButtonDelete_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <%--Modal Create Start--%>
    <div class="modal fade" id="ModalCreate" runat="server" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelCreate">Create Detail Games</h1>
                    <asp:Button ID="ButtonIconCloseCreate" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxNamaGameCreate" runat="server" CssClass="form-control" placeholder="Nama Game"></asp:TextBox>
                        <label for="TextBoxNamaGameCreate" runat="server">Nama Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeskripsiCreate" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Deskripsi"></asp:TextBox>
                        <label for="TextBoxDeskripsiCreate" runat="server">Deskripsi</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxTanggalRilisCreate" runat="server" TextMode="Date" CssClass="form-control" placeholder="Tanggal Rilis"></asp:TextBox>
                        <label for="TextBoxTanggalRilisCreate" runat="server">Tanggal Rilis</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeveloperCreate" runat="server" CssClass="form-control" placeholder="Developer"></asp:TextBox>
                        <label for="TextBoxDeveloperCreate" runat="server">Developer</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPublisherCreate" runat="server" CssClass="form-control" placeholder="Publisher"></asp:TextBox>
                        <label for="TextBoxPublisherCreate" runat="server">Publisher</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxModeGameCreate" runat="server" CssClass="form-control" placeholder="Mode Game"></asp:TextBox>
                        <label for="TextBoxModeGameCreate" runat="server">Mode Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxFranchisesCreate" runat="server" CssClass="form-control" placeholder="Franchises"></asp:TextBox>
                        <label for="TextBoxFranchisesCreate" runat="server">Franchises</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPerspektifPemainCreate" runat="server" CssClass="form-control" placeholder="Perspektif Pemain"></asp:TextBox>
                        <label for="TextBoxPerspektifPemainCreate" runat="server">Perspektif Pemain</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxHargaCreate" runat="server" CssClass="form-control" placeholder="Harga"></asp:TextBox>
                        <label for="TextBoxHargaCreate" runat="server">Harga</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonCloseCreate" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonCreate" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="ButtonCreate_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Create End--%>

    <%--Modal Show Start--%>
    <div class="modal fade" id="ModalShow" runat="server" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelShow">Edit Detail Games</h1>
                    <asp:Button ID="ButtonIconCloseShow" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxNamaGameShow" runat="server" CssClass="form-control" placeholder="Nama Game"></asp:TextBox>
                        <label for="TextBoxNamaGameShow" runat="server">Nama Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeskripsiShow" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Deskripsi"></asp:TextBox>
                        <label for="TextBoxDeskripsiShow" runat="server">Deskripsi</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxTanggalRilisShow" runat="server" TextMode="Date" CssClass="form-control" placeholder="Tanggal Rilis"></asp:TextBox>
                        <label for="TextBoxTanggalRilisShow" runat="server">Tanggal Rilis</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxDeveloperShow" runat="server" CssClass="form-control" placeholder="Developer"></asp:TextBox>
                        <label for="TextBoxDeveloperShow" runat="server">Developer</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPublisherShow" runat="server" CssClass="form-control" placeholder="Publisher"></asp:TextBox>
                        <label for="TextBoxPublisherShow" runat="server">Publisher</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxModeGameShow" runat="server" CssClass="form-control" placeholder="Mode Game"></asp:TextBox>
                        <label for="TextBoxModeGameShow" runat="server">Mode Game</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxFranchisesShow" runat="server" CssClass="form-control" placeholder="Franchises"></asp:TextBox>
                        <label for="TextBoxFranchisesShow" runat="server">Franchises</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxPerspektifPemainShow" runat="server" CssClass="form-control" placeholder="Perspektif Pemain"></asp:TextBox>
                        <label for="TextBoxPerspektifPemainShow" runat="server">Perspektif Pemain</label>
                    </div>
                    <div class="form-floating mt-3 mb-3">
                        <asp:TextBox ID="TextBoxHargaShow" runat="server" CssClass="form-control" placeholder="Harga"></asp:TextBox>
                        <label for="TextBoxHargaShow" runat="server">Harga</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonCloseShow" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonUpdateShow" runat="server" Text="Save changes" CssClass="btn btn-primary" OnClick="ButtonUpdateShow_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Show End--%>

    <%--Modal Genre Start--%>
    <div class="modal fade" id="ModalGenre" runat="server" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelGenre">Detail Genre</h1>
                    <asp:Button ID="ButtonIconCloseGenre" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <p>Genre :</p>
                    <asp:CheckBoxList ID="CheckBoxListGenre" runat="server" CssClass="list-group list-group-horizontal form-switch mt-3 mb-3"></asp:CheckBoxList>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonGenreClose" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonGenreCreate" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="ButtonGenreCreate_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Genre End--%>

    <%--Modal Platform Start--%>
    <div class="modal fade" id="ModalPlatform" runat="server" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalLabelPlatform">Detail Platform</h1>
                    <asp:Button ID="ButtonIconClosePlatform" runat="server" Text="" CssClass="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                </div>
                <div class="modal-body">
                    <p>Platform :</p>
                    <asp:CheckBoxList ID="CheckBoxListPlatform" runat="server" CssClass="list-group list-group-horizontal form-switch mt-3 mb-3"></asp:CheckBoxList>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonPlatformClose" runat="server" Text="Close" CssClass="btn btn-secondary" data-bs-dismiss="modal" />
                    <asp:Button ID="ButtonPlatformCreate" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="ButtonPlatformCreate_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--Modal Platform End--%>
</asp:Content>
