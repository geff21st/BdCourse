using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BDCourceForWeb
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ClearFields()
        {
            name_tb.Text = "";
            date_tb.Text = "";
            city_tb.Text = "";
            
            upd_tb.Text = "";
            del_tb.Text = "";
        }

        void PopupVisible(bool k)
        {
            Panel2.Visible = k;
            Panel1.Visible = k;
        }

        protected void addb_Click(object sender, EventArgs e)
        {
            ClearFields();
            PopupVisible(true);
            //string str = poltb.SelectedValue;
        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.DeleteCommand = "DELETE * FROM [Творческий коллектив] WHERE [КодКоллектива] = " + del_tb.Text + "";
                SqlDataSource1.Delete();

                ClearFields();
            }
            catch (Exception) { }
        }

        protected void addbut_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            try
            {

                SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
                //INSERT INTO [Концертная программа] ([Название], [Дата], [НомерЗала],  [Состоявшееся]) VALUES ('Алиса в стране чудес', '03.06.15', '1', '1')
                SqlDataSource1.InsertCommand = String.Format("INSERT INTO [Творческий коллектив] ([Название], [Город], [ДатаСоздания]) " +
                                                             "VALUES ('{0}', '{1}', '{2}')",
                        name_tb.Text,
                        city_tb.Text,
                        date_tb.Text
                    );
                SqlDataSource1.Insert();
                PopupVisible(false);

                ClearFields();
                GridView1.DataBind();
            }
            catch (Exception) { }
        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            try
            {
                SqlDataSource1.UpdateCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.UpdateCommand = String.Format("UPDATE  [Творческий коллектив] SET [Название]='{0}', [Город]='{1}', [ДатаСоздания]='{2}' " +
                                                             "WHERE [КодКоллектива]={3}",
                        name_tb.Text,
                        city_tb.Text,
                        date_tb.Text,
                        upd_tb.Text
                    );
                SqlDataSource1.Update();

                ClearFields();
                PopupVisible(false);
            }
            catch (Exception) { }
        }

        protected void cancelbut_Click(object sender, EventArgs e)
        {
            PopupVisible(false);
        }

        private string select_cmd = "SELECT * FROM [Творческий коллектив] ";

        protected void sortby_btn_Click(object sender, EventArgs e)
        {
            switch (sortby_ddl.SelectedIndex)
            {
                case 0: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Творческий коллектив].КодКоллектива"; break;
                case 1: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Творческий коллектив].Название"; break;
                case 2: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Творческий коллектив].Город"; break;
                case 3: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Творческий коллектив].ДатаСоздания"; break;
            }

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
    }
}