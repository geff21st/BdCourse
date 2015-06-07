using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BDCourceForWeb
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ClearFields()
        {
            name_tb.Text = "";
            date_tb.Text = "";
            room_tb.Text = "";
            
            done_ddl.ClearSelection();

            upd_tb.Text = "";
            del_tb.Text = "";
        }

        protected void addb_Click(object sender, EventArgs e)
        {
            ClearFields();
            PopupVisible(true);
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
                        done_ddl.SelectedIndex
                    );
                SqlDataSource1.Insert();
                PopupVisible(false);

                ClearFields();
                GridView1.DataBind();
            }
            catch (Exception) {}
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
                        done_ddl.SelectedIndex,
                        upd_tb.Text
                    );
                SqlDataSource1.Update();

                ClearFields();
                PopupVisible(false);
            }
            catch (Exception) { }
        }

        private string select_cmd = "SELECT * FROM [Концертная программа]";

        protected void future_btn_Click(object sender, EventArgs e)
        {
            if (future_btn.Text == "Все события")
            {
                future_btn.Text = "Будущие события";
                SqlDataSource1.SelectCommand = select_cmd;
            }
            else
            {
                future_btn.Text = "Все события";
                SqlDataSource1.SelectCommand = select_cmd + " WHERE ((([Концертная программа].Состоявшееся)=False))";
            }

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void cancelbut_Click(object sender, EventArgs e)
        {
            PopupVisible(false);
        }

        void PopupVisible(bool k)
        {
            Panel2.Visible = k;
            Panel1.Visible = k;
        }

        protected void sortby_btn_Click(object sender, EventArgs e)
        {
            switch (sortby_ddl.SelectedIndex)
            {
                case 0: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].КодПрограммы"; break;
                case 1: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].Название"; break;
                case 2: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].Дата"; break;
                case 3: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].НомерЗала"; break;
                case 4: SqlDataSource1.SelectCommand = select_cmd + " ORDER BY [Концертная программа].Состоявшееся"; break;
            }

            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
    }
}