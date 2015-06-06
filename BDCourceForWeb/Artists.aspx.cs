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
            room_tb.Text = "";
            done_tb.Text = "";

            upd_tb.Text = "";
            del_tb.Text = "";
        }

        protected void addb_Click(object sender, EventArgs e)
        {
            ClearFields();
            Panel1.Visible = true;
        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.DeleteCommand = "DELETE * FROM [Концертная программа] WHERE [КодПрограммы] = " + del_tb.Text + "";
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
                SqlDataSource1.InsertCommand = String.Format("INSERT INTO [Концертная программа] ([Название], [Дата], [НомерЗала],  [Состоявшееся]) " +
                                                             "VALUES ('{0}', '{1}', '{2}', '{3}')",
                        name_tb.Text,
                        date_tb.Text,
                        room_tb.Text,
                        done_tb.Text
                    );
                SqlDataSource1.Insert();
                Panel1.Visible = false;

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
                SqlDataSource1.UpdateCommand = String.Format("UPDATE  [Концертная программа] SET [Название]='{0}', [Дата]='{1}', [НомерЗала]='{2}', [Состоявшееся]='{3}' " +
                                                             "WHERE [КодПрограммы]={4}",
                        name_tb.Text,
                        date_tb.Text,
                        room_tb.Text,
                        done_tb.Text,
                        upd_tb.Text
                    );
                SqlDataSource1.Update();

                ClearFields();
                Panel1.Visible = false;
            }
            catch (Exception) { }
        }

        protected void cancelbut_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}