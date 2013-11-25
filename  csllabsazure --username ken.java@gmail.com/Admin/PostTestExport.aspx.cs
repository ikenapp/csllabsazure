using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostTestExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String labid = Request.QueryString["labid"];
        if (!String.IsNullOrEmpty(labid))
        {
            int lab_id = int.Parse(labid);
            using (LabsDBEntities db = new LabsDBEntities())
            {
                Survey s = db.Surveys.Where(c => c.labid == lab_id && c.surveyid == 24).First();
                var dataTable = s;
                StringBuilder builder = new StringBuilder();
                List<string> columnNames = new List<string>();
                List<string> rows = new List<string>();

                //foreach (DataColumn column in dataTable.Columns)
                //{
                //    columnNames.Add(column.ColumnName);
                //}

                //builder.Append(string.Join(",", columnNames.ToArray())).Append("\n");

                //foreach (DataRow row in dataTable.Rows)
                //{
                //    List<string> currentRow = new List<string>();

                //    foreach (DataColumn column in dataTable.Columns)
                //    {
                //        object item = row[column];

                //        currentRow.Add(item.ToString());
                //    }

                //    rows.Add(string.Join(",", currentRow.ToArray()));
                //}

                builder.Append(string.Join("\n", rows.ToArray()));

                Response.Clear();
                Response.ContentType = "text/csv";
                Response.AddHeader("Content-Disposition", "attachment;filename=myfilename.csv");
                Response.Write(builder.ToString());
                Response.End();

            }
        }
        
    }
}