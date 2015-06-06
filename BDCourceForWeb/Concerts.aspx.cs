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
            type_tb.Text = "";
            program_tb.Text = "";
            artist_tb.Text = "";
            name_tb.Text = "";
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

        }

        protected void upd_btn_Click(object sender, EventArgs e)
        {

        }

        protected void cancelbut_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}