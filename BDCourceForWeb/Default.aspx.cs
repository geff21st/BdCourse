using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BDCourceForWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addb_Click(object sender, EventArgs e)
        {
            ClearFields();
            Panel1.Visible = true;
        }

        protected void ClearFields()
        {
            //type_tb.Text = "";
            //program_tb.Text = "";
            //artist_tb.Text = "";
            name_tb.Text = "";
            upd_tb.Text = "";
            del_tb.Text = "";

            program_ddl.ClearSelection();
            artist_ddl.ClearSelection();
            type_ddl.ClearSelection();
        }

        protected void cancelbut_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void addbut_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            try
            {

                SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.InsertCommand = String.Format("INSERT INTO [Концертный номер] ([ТипНомера], [Программа], [Коллектив],  [Название]) " +
                                                             "VALUES ('{0}', '{1}', '{2}', '{3}')",
                        type_ddl.SelectedValue, 
                        program_ddl.SelectedValue, 
                        artist_ddl.SelectedValue,
                        name_tb.Text
                    );
                SqlDataSource1.Insert();
                Panel1.Visible = false;

                ClearFields();
                GridView1.DataBind();
            } catch (Exception) {}
        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.DeleteCommand = "DELETE * FROM [Концертный номер] WHERE [КодНомера] = " + del_tb.Text + "";
                SqlDataSource1.Delete();

                ClearFields();
            } catch (Exception) {}
        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            try
            {
                SqlDataSource1.UpdateCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.UpdateCommand = String.Format("UPDATE  [Концертный номер] SET [ТипНомера]='{0}', [Программа]='{1}', [Коллектив]='{2}', [Название]='{3}' WHERE [КодНомера]={4}", 
                        type_ddl.SelectedValue,
                        program_ddl.SelectedValue,
                        artist_ddl.SelectedValue,
                        name_tb.Text,
                        upd_tb.Text
                    );
                SqlDataSource1.Update();

                ClearFields();
                Panel1.Visible = false;
            }
            catch (Exception) {}
        }

        private string select_cmd =
            "SELECT [Концертный номер].КодНомера, [Концертная программа].Название, [Концертный номер].Название, [Творческий коллектив].Название, [Типы номеров].[Тип номера] FROM [Типы номеров] " +
            "INNER JOIN ([Творческий коллектив] INNER JOIN ([Концертная программа] INNER JOIN [Концертный номер] " +
            "ON [Концертная программа].КодПрограммы = [Концертный номер].Программа) ON [Творческий коллектив].КодКоллектива = [Концертный номер].Коллектив) ON [Типы номеров].КодТипа = [Концертный номер].ТипНомера ";

        protected void vocal_Click(object sender, EventArgs e)
        {
            if (vocal_btn.Text == "Все номера")
            {
                vocal_btn.Text = "Вокальные номера";
                SqlDataSource1.SelectCommand = select_cmd;
            }
            else
            {
                vocal_btn.Text = "Все номера";
                SqlDataSource1.SelectCommand = select_cmd + " WHERE ((([Типы номеров].[Тип номера])='Вокал'))";
            }

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void filter_btn_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = select_cmd + " WHERE ((([Концертный номер].[Коллектив])=" + filter_ddl.SelectedValue + "))";

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void sortby_btn_Click(object sender, EventArgs e)
        {
            switch (sortby_ddl.SelectedIndex)
            {
                case 0: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертный номер].КодНомера"; break;
                case 1: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертный номер].Название"; break;
                case 2: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Творческий коллектив].[Название]"; break;
                case 3: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].Название"; break;
                case 4: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Типы номеров].[Тип номера]"; break;
            }

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
    }
}