<%@ Page Title="Исполнители" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artists.aspx.cs" Inherits="BDCourceForWeb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="act_btns">
    <asp:Button ID="addb" runat="server" style="float: left" Text="Редактирование" OnClick="addb_Click" />
    <div class="delete_panel">
        <asp:Button ID="del_btn" runat="server" Text="Удалить" OnClick="del_btn_Click" />
        <asp:TextBox ID="del_tb" runat="server"></asp:TextBox>
    </div>
    </div>
    <asp:Panel ID="Panel1" runat="server" 
        CssClass="add_panel"
        Visible="False" Wrap="False">
        <table>
            <tr>
                <td>Название</td>
                <td>
                    <asp:TextBox ID="name_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV1" runat="server" 
                        ControlToValidate="name_tb" ErrorMessage="*" ForeColor="Red" 
                        EnableTheming="True"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Дата</td>
                <td>
                    <asp:TextBox ID="date_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV2" runat="server" 
                        ControlToValidate="date_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Номер зала</td>
                <td>
                    <asp:TextBox ID="room_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV3" runat="server" 
                        ControlToValidate="room_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Состоявшееся</td>
                <td>
                    <asp:TextBox ID="done_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="done_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td colspan = "2">
                    <asp:Button ID="addbut" runat="server" style="float: left" Text="Добавить" OnClick="addbut_Click"/>

                    <div class="delete_panel">
                        <asp:Button ID="upd_btn" runat="server" Text="Обновить" OnClick="upd_btn_Click" />
                        <asp:TextBox ID="upd_tb" runat="server"></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="cancelbut" runat="server" CausesValidation="False" 
                        Text="Отмена" 
                        OnClick="cancelbut_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="КодКоллектива" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="КодКоллектива" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="КодКоллектива" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Город" HeaderText="Город" SortExpression="Город" />
            <asp:BoundField DataField="ДатаСоздания" dataformatstring="{0:MM.dd.yyyy}" HeaderText="Дата cоздания" SortExpression="ДатаСоздания" />
        </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6894B3" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EAEDEF" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Творческий коллектив]"></asp:SqlDataSource>
</asp:Content>
