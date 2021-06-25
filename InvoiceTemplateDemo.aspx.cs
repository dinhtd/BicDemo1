using System;
using System.Data;
using System.Drawing;
using BicCare.Generated.Base;
using BicCare.Generated.BusinessObjects;
using DbUtil;
using Infragistics.Web.UI;
using Infragistics.WebUI.UltraWebGrid;
using NHibernate;

public partial class InvoiceTemplateDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        dgrInvoice.DataSource = null;
        dgrInvoice.DataBind();
        try
        {

            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(AppDomain.CurrentDomain.BaseDirectory + @"\\UploadFile\\" + FileUpload1.FileName);
                Label1.Text = "File Uploaded: " + FileUpload1.FileName;
            }
            else
            {
                Label1.Text = "No File Uploaded.";
            }


            string fileName = AppDomain.CurrentDomain.BaseDirectory + "UploadFile\\" + FileUpload1.PostedFile.FileName;

            
            if (string.IsNullOrEmpty(fileName))
            {
                MessageBox.Show("Phải chọn file XML");
                return;
            }

            var result = clsPublic.GetInvoiceXML(fileName);

            dgrInvoice.DataSource = result;
            dgrInvoice.AutoGenerateColumns = true;
            
            dgrInvoice.DataBind();

            

            
        }
        catch(Exception ex)
        {
            MessageBox.Show("File XML không đúng định dạng dữ liệu:" + ex.Message);
        }
    }


    protected void uwgClaimDetail_AddRowBatch(object sender, RowEventArgs e)
    {
        DataTableHelper.AddChangeCommand(e, (DataTable) ViewState["DATA"]);

    }

    protected void uwgClaimDetail_DeleteRowBatch(object sender, RowEventArgs e)
    {
        DataTableHelper.DeleteChangeCommand(e, (DataTable)ViewState["DATA"]);
    }

    protected void uwgClaimDetail_InitializeLayout(object sender, LayoutEventArgs e)
    {
        uwgClaimDetail.Bands[0].AddButtonCaption = "Thêm mới";

    }

    protected void uwgClaimDetail_InitializeDataSource(object sender, UltraGridEventArgs e)
    {
        var sql = @"select * from bicsystem.list.invoice_template where active=1 order by id";
        
        DataTable dataTable = DbUtil.DbUtil.get_datatable(sql);

        var idColumn = new[] { dataTable.Columns["id"] };

        dataTable.PrimaryKey = idColumn;

        dataTable.AcceptChanges();

        uwgClaimDetail.DataSource = ViewState["DATA"] = dataTable;

    }

    protected void uwgClaimDetail_UpdateRowBatch(object sender, RowEventArgs e)
    {
        DataTableHelper.UpdateChangeCommand(e, (DataTable)ViewState["DATA"]);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        var session = NHibernateSessionManager.Instance.CreateISession();
        var tx = session.BeginTransaction();
        try
        {
            SaveInvoiceTempalate(session, tx);
            tx.Commit();
            session.Disconnect();
            lblMessage.Text = "Cập nhật thành công!";
            lblMessage.ForeColor = Color.Blue;

        }
        catch(Exception ex)
        {
            lblMessage.ForeColor = Color.Red;
            tx.Rollback();
            session.Disconnect();
        }

    }

    public void SaveInvoiceTempalate(ISession session, ITransaction tx)
    {

     

        var dt = (DataTable)ViewState["DATA"];

        var dtInsert = dt.GetChanges(DataRowState.Added);

        var dtUpdate = dt.GetChanges(DataRowState.Modified);

        var dtDelete = dt.GetChanges(DataRowState.Deleted);

        string unknown = "UNKNOWN";

        try
        {
            if (dtInsert != null)
            {
                foreach (DataRow row in dtInsert.Rows)
                {
                    var invoiceTemplate = new InvoiceTemplate();
                    

                    invoiceTemplate.Provider = row["provider"]!= DBNull.Value ? row["provider"].ToString() : unknown;

                    invoiceTemplate.InvoiceType = row["invoice_type"] != DBNull.Value ? row["invoice_type"].ToString() : unknown;
                    invoiceTemplate.InvoiceSerial = row["invoice_serial"]!= DBNull.Value ? row["invoice_serial"].ToString():unknown;
                    invoiceTemplate.InvoiceNum = row["invoice_num"]!=DBNull.Value?row["invoice_num"].ToString():unknown;
                    invoiceTemplate.IssuedDate = row["issued_date"]!= DBNull.Value?row["issued_date"].ToString():unknown;
                    invoiceTemplate.SellerName = row["seller_name"]!=DBNull.Value?row["seller_name"].ToString():unknown;
                    invoiceTemplate.SellerTaxCode = row["seller_tax_code"]!=DBNull.Value? row["seller_tax_code"].ToString():unknown;
                    invoiceTemplate.SellerAddress = row["seller_address"]!=DBNull.Value?row["seller_address"].ToString():unknown;
                    invoiceTemplate.ItemName = row["item_name"]!=DBNull.Value?row["item_name"].ToString():unknown;
                    invoiceTemplate.AmountMoney = row["amount_money"]!=DBNull.Value? row["amount_money"].ToString():unknown;
                    invoiceTemplate.VatPercentage = row["vat_percentage"]!=DBNull.Value? row["vat_percentage"].ToString():unknown;
                    invoiceTemplate.VatMount = row["vat_mount"]!=DBNull.Value? row["vat_mount"].ToString():unknown;
                    invoiceTemplate.TotalMoney = row["total_money"]!=DBNull.Value? row["total_money"].ToString():unknown;
                    invoiceTemplate.Active = true;
                    session.Save(invoiceTemplate);
                }
            }

            if (dtUpdate != null)
            {
                foreach (DataRow row in dtUpdate.Rows)
                {
                    var invoiceTemplate = session.Get<InvoiceTemplate>(decimal.Parse(row["id"].ToString()));

                    invoiceTemplate.Provider = row["provider"] != DBNull.Value ? row["provider"].ToString() : unknown;

                    invoiceTemplate.InvoiceType = row["invoice_type"] != DBNull.Value ? row["invoice_type"].ToString() : unknown;
                    invoiceTemplate.InvoiceSerial = row["invoice_serial"] != DBNull.Value ? row["invoice_serial"].ToString() : unknown;
                    invoiceTemplate.InvoiceNum = row["invoice_num"] != DBNull.Value ? row["invoice_num"].ToString() : unknown;
                    invoiceTemplate.IssuedDate = row["issued_date"] != DBNull.Value ? row["issued_date"].ToString() : unknown;
                    invoiceTemplate.SellerName = row["seller_name"] != DBNull.Value ? row["seller_name"].ToString() : unknown;
                    invoiceTemplate.SellerTaxCode = row["seller_tax_code"] != DBNull.Value ? row["seller_tax_code"].ToString() : unknown;
                    invoiceTemplate.SellerAddress = row["seller_address"] != DBNull.Value ? row["seller_address"].ToString() : unknown;
                    invoiceTemplate.ItemName = row["item_name"] != DBNull.Value ? row["item_name"].ToString() : unknown;
                    invoiceTemplate.AmountMoney = row["amount_money"] != DBNull.Value ? row["amount_money"].ToString() : unknown;
                    invoiceTemplate.VatPercentage = row["vat_percentage"] != DBNull.Value ? row["vat_percentage"].ToString() : unknown;
                    invoiceTemplate.VatMount = row["vat_mount"] != DBNull.Value ? row["vat_mount"].ToString() : unknown;
                    invoiceTemplate.TotalMoney = row["total_money"] != DBNull.Value ? row["total_money"].ToString() : unknown;

                    session.Save(invoiceTemplate);
                }
            }
            if (dtDelete != null)
            {
                dtDelete.RejectChanges();

                foreach (DataRow deleteRow in dtDelete.Rows)
                {
                    var invoiceTemplate = session.Get<InvoiceTemplate>(decimal.Parse(deleteRow["id"].ToString()));
                    invoiceTemplate.Active = false;

                    session.SaveOrUpdate(invoiceTemplate);
                }
            }

        
            if (dtInsert != null)
                dtInsert.RejectChanges();
            if (dtUpdate != null)
                dtUpdate.RejectChanges();
            if (dtDelete != null)
                dtDelete.RejectChanges();
            dt.RejectChanges();

           
            
        }
        catch (Exception ex)
        {
         
            throw new Exception(ex.Message);
            


        }


    }

}