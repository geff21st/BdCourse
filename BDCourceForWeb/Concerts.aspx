<%@ Page Title="Список концертов" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Concerts.aspx.cs" Inherits="BDCourceForWeb.About" %>

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
                <td>Программа</td>
                <td>
                    <asp:TextBox ID="program_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV1" runat="server" 
                        ControlToValidate="program_tb" ErrorMessage="*" ForeColor="Red" 
                        EnableTheming="True"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Название номера</td>
                <td>
                    <asp:TextBox ID="name_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV2" runat="server" 
                        ControlToValidate="name_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Исполнитель</td>
                <td>
                    <asp:TextBox ID="artist_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV3" runat="server" 
                        ControlToValidate="artist_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Тип номера</td>
                <td>
                    <asp:TextBox ID="type_tb" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="type_tb" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="КодПрограммы" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="КодПрограммы" HeaderText="КодПрограммы" InsertVisible="False" ReadOnly="True" SortExpression="КодПрограммы" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
            <asp:BoundField DataField="НомерЗала" HeaderText="НомерЗала" SortExpression="НомерЗала" />
            <asp:CheckBoxField DataField="Состоявшееся" HeaderText="Состоявшееся" SortExpression="Состоявшееся" />
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
