<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GameBill.pages.admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>GameBill - Admin Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
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
                <asp:ListView ID="ListViewGames" runat="server" OnPagePropertiesChanging="ListViewGames_PagePropertiesChanging" OnItemCommand="ListViewGames_ItemCommand" OnItemDeleting="ListViewGames_ItemDeleting">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Judul</th>
                                <th>Isi</th>
                                <th>Tanggal</th>
                                <th>Aksi</th>
                            </tr>
                            <tr id="ItemPlaceHolder" runat="server">
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="pager" runat="server" colspan="5" class="text-center">
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
                                <asp:Label ID="LabelJudul" runat="server" Text='<%#Eval("judul") %>'></asp:Label>
                            </td>
                            <td>
                                <%#Regex.Replace(Eval("isi").ToString(), "<[a-zA-Z/].*?>", String.Empty).PadRight(140).Substring(0,120).TrimEnd() %>
                            </td>
                            <td>
                                <asp:Label ID="LabelTanggal" runat="server" Text='<%#String.Format("{0:dd-MMM-yyy}", Eval("tanggal")) %>'></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLinkEdit" runat="server" CssClass="text-secondary" NavigateUrl='<%#Eval ("id", "~/pages/member/article/edit.aspx?id={0}") %>'><i class="bi bi-pencil me-2"></i></asp:HyperLink>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="delete" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('Are you sure?')"><i class="bi bi-trash me-2"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
