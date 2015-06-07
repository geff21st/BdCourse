<%@ Page Title="Список концертов" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Concerts.aspx.cs" Inherits="BDCourceForWeb.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="act_btns">
        <asp:Button ID="addb" runat="server" style="float: left" Text="Редактирование" OnClick="addb_Click" />
        <div class="controls_group">
            <asp:TextBox ID="del_tb" runat="server" />
            <asp:Button ID="del_btn" runat="server" Text="Удалить" OnClick="del_btn_Click" />
        </div>
        <div class="controls_group">
            <asp:DropDownList ID="sortby_ddl" runat="server">
                <asp:ListItem>#</asp:ListItem>
                <asp:ListItem>Название</asp:ListItem>
                <asp:ListItem>Дата</asp:ListItem>
                <asp:ListItem>Номер зала</asp:ListItem>
                <asp:ListItem>Состоявшееся</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="sortby_btn" runat="server" Text="Сортировать" OnClick="sortby_btn_Click" />
        </div>
        <asp:Button ID="future_btn" runat="server" style="float: left" Text="Будущие события" OnClick="future_btn_Click" />
    </div>
    <asp:Panel ID="Panel2" runat="server" CssClass="popup_box" Visible="False" Wrap="False">
    <asp:Panel ID="Panel1" runat="server" CssClass="add_panel" Visible="False" Wrap="False">
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
                    <asp:RegularExpressionValidator ID="REV1" runat="server" 
                        ControlToValidate="date_tb" ErrorMessage="Неверный формат" ForeColor="Red" 
                        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
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
                    <asp:DropDownList ID="done_ddl" runat="server">
                        <asp:ListItem>Нет</asp:ListItem>
                        <asp:ListItem>Да</asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="done_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>

            <tr>
                <td colspan = "2">
                    <asp:Button ID="addbut" CssClass="row_item" runat="server" style="float: left" Text="Добавить" OnClick="addbut_Click"/>

                    <div class="controls_group">
                        <asp:TextBox ID="upd_tb" runat="server" />
                        <asp:Button ID="upd_btn" runat="server" Text="Обновить" OnClick="upd_btn_Click" />
                    </div>
                    
                    <asp:Button ID="cancelbut" CssClass="row_item" runat="server" CausesValidation="False" 
                        Text="Скрыть" 
                        OnClick="cancelbut_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" CssClass="mygrid" AutoGenerateColumns="False" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="КодПрограммы" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="КодПрограммы" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="КодПрограммы" />
            <asp:BoundField DataField="Название" ItemStyle-Font-Bold="True" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" dataformatstring="{0:MM.dd.yyyy}" SortExpression="Дата" />
            <asp:BoundField DataField="НомерЗала" HeaderText="Номер зала" SortExpression="НомерЗала" />
            <asp:CheckBoxField DataField="Состоявшееся" HeaderText="Состоялось" SortExpression="Состоявшееся" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Концертная программа]"></asp:SqlDataSource>
</asp:Content>
