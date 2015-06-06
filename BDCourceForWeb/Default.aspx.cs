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
            type_tb.Text = "";
            program_tb.Text = "";
            artist_tb.Text = "";
            name_tb.Text = "";
            upd_tb.Text = "";
            del_tb.Text = "";
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
                        type_tb.Text, 
                        program_tb.Text, 
                        artist_tb.Text,
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
                        type_tb.Text,
                        program_tb.Text,
                        artist_tb.Text,
                        name_tb.Text,
                        upd_tb.Text
                    );
                SqlDataSource1.Update();

                ClearFields();
                Panel1.Visible = false;
            }
            catch (Exception) {}
        }
    }
}