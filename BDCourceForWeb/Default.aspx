<%@ Page Title="Список номеров" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BDCourceForWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="act_btns">
        <asp:Button ID="addb" runat="server" style="float: left" Text="Редактирование" OnClick="addb_Click" />
        <div class="controls_group">
            <asp:TextBox ID="del_tb" runat="server" />
            <asp:Button ID="del_btn" runat="server" Text="Удалить" OnClick="del_btn_Click" />
        </div>
        <div class="controls_group">
            <asp:DropDownList ID="filter_ddl" runat="server" DataSourceID="SqlDataSource5" DataTextField="Название" DataValueField="КодКоллектива" />
            <asp:Button ID="filter_btn" runat="server" Text="Выбрать" OnClick="filter_btn_Click" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Название], [КодКоллектива] FROM [Творческий коллектив]" />
        <div class="controls_group">
            <asp:DropDownList ID="sortby_ddl" runat="server">
                <asp:ListItem>#</asp:ListItem>
                <asp:ListItem>Название</asp:ListItem>
                <asp:ListItem>Исполнитель</asp:ListItem>
                <asp:ListItem>Программа</asp:ListItem>
                <asp:ListItem>Тип номера</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="sortby_btn" runat="server" Text="Сортировать" OnClick="sortby_btn_Click" />
        </div>
        <asp:Button ID="vocal_btn" runat="server" style="float: left" Text="Вокальные номера" OnClick="vocal_Click" />
    </div>
    <asp:Panel ID="Panel2" runat="server" CssClass="popup_box" Visible="False" Wrap="False">
    <asp:Panel ID="Panel1" runat="server" CssClass="add_panel" Visible="False" Wrap="False">
        <table>
            <tr>
                <td>Программа</td>
                <td>
                    <asp:DropDownList ID="program_ddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="Название" DataValueField="КодПрограммы"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Название], [КодПрограммы] FROM [Концертная программа]" />
                </td>
            </tr>

            <tr>
                <td>Название номера</td>
                <td>
                    <asp:TextBox ID="name_tb" runat="server" />
                    <asp:RequiredFieldValidator ID="RFV2" runat="server" 
                        ControlToValidate="name_tb" ErrorMessage="*" ForeColor="Red" />
                </td>
            </tr>

            <tr>
                <td>Исполнитель</td>
                <td>
                    <asp:DropDownList ID="artist_ddl" runat="server" DataSourceID="SqlDataSource3" DataTextField="Название" DataValueField="КодКоллектива" />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Название], [КодКоллектива] FROM [Творческий коллектив]" />
                </td>
            </tr>

            <tr>
                <td>Тип номера</td>
                <td>
                    <asp:DropDownList ID="type_ddl" runat="server" DataSourceID="SqlDataSource4" DataTextField="Тип номера" DataValueField="КодТипа" />
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Типы номеров]" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="addbut" runat="server" CssClass="row_item" Text="Добавить" OnClick="addbut_Click"/>
                    <div class="controls_group">
                        <asp:TextBox ID="upd_tb" runat="server" />
                        <asp:Button ID="upd_btn" runat="server" Text="Обновить" OnClick="upd_btn_Click" />
                    </div>
                    <asp:Button ID="cancelbut" runat="server" CssClass="row_item" CausesValidation="False" 
                        Text="Скрыть" 
                        OnClick="cancelbut_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </asp:Panel>
    <%--<div class="row">
        <div class="col-md-14">--%>         
    <asp:GridView ID="GridView1" CssClass="mygrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#F7FAFD" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="КодНомера" HeaderText="#" InsertVisible="False" SortExpression="КодНомера" />
            <asp:BoundField DataField="Творческий коллектив.Название" HeaderText="Исполнитель" SortExpression="Творческий коллектив.Название" />
            <asp:BoundField DataField="Концертный номер.Название" ItemStyle-Font-Bold="True" HeaderText="Название номера" SortExpression="Концертный номер.Название"></asp:BoundField>
            <asp:BoundField DataField="Концертная программа.Название" HeaderText="Программа" SortExpression="Концертная программа.Название" />
            <asp:BoundField DataField="Тип номера" HeaderText="Тип номера" SortExpression="Тип номера" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Концертный номер].КодНомера, [Концертная программа].Название, [Концертный номер].Название, [Творческий коллектив].Название, [Типы номеров].[Тип номера]
FROM [Концертная программа] INNER JOIN ([Типы номеров] INNER JOIN ([Творческий коллектив] INNER JOIN [Концертный номер] ON [Творческий коллектив].КодКоллектива = [Концертный номер].Коллектив) ON [Типы номеров].КодТипа = [Концертный номер].ТипНомера) ON [Концертная программа].КодПрограммы = [Концертный номер].Программа" />        
        <%--</div>
    </div>--%>
</asp:Content>
