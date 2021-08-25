using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class TravelRequest
{
    #region variables/properties

    private string ambassador;

    public string Ambassador
    {
        get { return ambassador; }
        set { ambassador = value; }
    }

    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }

    private string startDate;

    public string StartDate
    {
        get { return startDate; }
        set { startDate = value; }
    }
    private string endDate;

    public string EndDate
    {
        get { return endDate; }
        set { endDate = value; }
    }
    private string destination;

    public string Destination
    {
        get { return destination; }
        set { destination = value; }
    }
    private string purpose;

    public string Purpose
    {
        get { return purpose; }
        set { purpose = value; }
    }
    private string remarks;

    public string Remarks
    {
        get { return remarks; }
        set { remarks = value; }
    } 
    #endregion

    public DataRowCollection TravelRequestList()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM [admin_vTravelRequest]");
        DataSet ds = general.getSet(cmd);
        return ds.Tables[0].Rows;
    }

    public bool GetTravelRequest(String refId)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [admin_vTravelRequest] WHERE ID = @ID");
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = refId;
            DataSet ds = general.getSet(cmd);
            if (ds.Tables.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Id = dr["ID"].ToString();
                    StartDate = dr["StartDate"].ToString();
                    EndDate = dr["EndDate"].ToString();
                    Destination = dr["Destination"].ToString();
                    Remarks = dr["Remarks"].ToString();
                    Purpose = dr["Purpose"].ToString();
                    Ambassador = dr["Ambassador"].ToString();
                }
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
            return false;
        }
    }
}