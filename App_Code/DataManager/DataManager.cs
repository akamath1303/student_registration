using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DataManager
/// </summary>
public class DataManager
{
    public SqlConnection myConn;
    private SqlTransaction myTrans;
    public int ConnectionTimeOut;
    string role = "";
    string Avg = "";

    public DataManager()
    {
    }

    //Get values from Config Settings
    public static string GetConfig(string configSettingName)
    {
        return System.Configuration.ConfigurationManager.AppSettings[configSettingName];
    }

    # region Routine to Establish SQL Connection
    /*-------------------------------------
         Routine to establish SQL Connection
        -------------------------------------*/
    public bool OpenSQLConnection()
    {
        bool bAttemptToConnect = false;
        try
        {
            if (myConn == null)
                bAttemptToConnect = true;
            if (bAttemptToConnect == false)
            {
                if ((myConn.State == ConnectionState.Closed) || (myConn.State == ConnectionState.Broken))
                    bAttemptToConnect = true;
            }
            if (bAttemptToConnect)
            {
                myConn = new SqlConnection();
                myConn.ConnectionString = GetConnectionString();
                myConn.Open();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
        return bAttemptToConnect;
    }
    #endregion

    #region Routine to Close SQL Connection
    /*-------------------------------------
        ' Routine to Close Connection
        '-------------------------------------*/
    public void CloseConnection()
    {
        try
        {
            if (myConn.State == ConnectionState.Open)
                myConn.Close();
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    # endregion

    # region Routine to get Connection String from Web.Config
    /*---------------------------------------------------
        ' Routine to get Connection String from Web.Config
        '---------------------------------------------------*/
    public string GetConnectionString()
    {
        //string strConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
        string strConnectionString = ConfigurationManager.AppSettings["ConnStr"];
        return strConnectionString;
    }
    #  endregion
    public string ExecuteQuery(string a_strSQLCommand)
    {
        if (OpenSQLConnection())
        {
            System.Data.SqlClient.SqlCommand objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
            try
            {
                objCommand.Connection = myConn;
                objCommand.CommandType = CommandType.Text;
                objCommand.ExecuteNonQuery();
                objCommand.Dispose();
                CloseConnection();
                return "Executed Successfully";
            }
            catch (Exception ex)
            {
                return ex.Message.Trim();
            }
        }
        else
        {
            return "Connection Failed";
        }
    }


    # region Routine to Manage SQL Transactions
    /*-----------------------------------------
           Manage SQL Transactions
        '---------------------------------------------*/
    public SqlTransaction Transaction
    {
        get { return myTrans; }
        set { }
    }

    public void BeginTransaction()
    {
        myTrans = myConn.BeginTransaction();
    }

    public void CommitTransaction()
    {
        if (myTrans != null)
        {
            try
            {
                myTrans.Commit();
            }
            catch (Exception)
            {

            }
            finally
            {
                myTrans = null;
            }
        }
    }

    public void RollBackTransaction()
    {
        if (myTrans != null)
            myTrans.Rollback();
    }

    public bool InTransaction()
    {
        return (myTrans != null);
    }

    # endregion

    # region Routine to Get DataSet for Passed SQL Command
    /*-----------------------------------------------
        ' Routine to Get DataSet for Passed SQL Command
        '-----------------------------------------------*/
    public DataSet GetDataSet(string a_strDataSource)
    {
        System.Data.SqlClient.SqlDataAdapter myAdapter;
        DataSet DS;
        try
        {
            DS = new DataSet();
            myAdapter = new System.Data.SqlClient.SqlDataAdapter(a_strDataSource, GetConnectionString());
            myAdapter.SelectCommand.CommandTimeout = ConnectionTimeOut;
            myAdapter.Fill(DS);
            myAdapter.Dispose();
            myAdapter = null;
            return DS;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
        finally
        {
            // DS.Dispose();
        }
    }
    # endregion

    # region Routine to Get Scalar Variable for Passed SQL Command
    /*-----------------------------------------------
        ' Routine to Get Scalar Variable for Passed SQL Command
        '-----------------------------------------------*/
    public int GetSQLDataScalar(string a_strSQLCommand)
    {
        System.Data.SqlClient.SqlCommand objCommand;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
            objCommand.Connection = myConn;
            objCommand.CommandTimeout = ConnectionTimeOut;
            objCommand.CommandType = CommandType.Text;
            int ICount = (int)objCommand.ExecuteScalar();
            objCommand.Dispose();
            return ICount;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return 0;
        }
        finally
        {
            CloseConnection();
        }
    }
    #endregion

    #region Routine to Execute SQl Command
    /*---------------------------------------------------
        ' Routine to Execute SQl Command
        '---------------------------------------------------*/
    public string ExecuteStoredProcedure(string a_strSQLCommand, bool a_bReturnValue)
    {
        if (!a_bReturnValue)
        {
            if (OpenSQLConnection())
            {
                System.Data.SqlClient.SqlCommand objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
                try
                {
                    objCommand.Connection = myConn;
                    objCommand.CommandType = CommandType.Text;
                    objCommand.ExecuteNonQuery();
                    objCommand.Dispose();
                    return string.Empty;
                }
                catch (Exception ex)
                {
                    return ex.Message.Trim();
                }
            }
            else
            {
                return "Connection Failed";
            }
        }
        else
        {
            try
            {
                DataView oDv = GetDataView(a_strSQLCommand);
                DataTable oDt = oDv.Table;
                if (oDt == null)
                {
                    return String.Empty;
                }
                string strRetString = String.Empty;
                try
                {
                    strRetString = oDt.Rows[0].ItemArray[0] as string;
                }
                catch (Exception ex)
                {
                    ex.Data.Clear();
                }
                oDt.Dispose();
                oDt = null;
                return strRetString;
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
                return String.Empty;
            }

        }
    }
    # endregion

    #region Routine to execute and return SQlDataReader
    /*-------------------------------------------------------------
        ' Routine to execute and return SQlDataReader
        '-------------------------------------------------------------*/
    public SqlDataReader GetSQLDataReader(string a_strSQLCommand)
    {
        System.Data.SqlClient.SqlDataReader oSQLDR;
        System.Data.SqlClient.SqlCommand objCommand;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            objCommand = new System.Data.SqlClient.SqlCommand(a_strSQLCommand);
            objCommand.Connection = myConn;
            objCommand.CommandTimeout = ConnectionTimeOut;
            objCommand.CommandType = CommandType.Text;
            oSQLDR = objCommand.ExecuteReader();
            objCommand.Dispose();
            return oSQLDR;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
    }
    #endregion

    # region  Routine to Check whether the Record Exists in Data Base
    /*-------------------------------------------------------------
        ' Routine to Check whether the Record Exists in Data Base
        '-------------------------------------------------------------*/
    public bool CheckIsRecordExist(string a_strChkSQLCommand)
    {
        System.Data.SqlClient.SqlCommand objCommand;
        bool RecordExists = false;

        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            objCommand = new System.Data.SqlClient.SqlCommand(a_strChkSQLCommand);
            objCommand.Connection = myConn;
            objCommand.CommandTimeout = ConnectionTimeOut;
            objCommand.CommandType = CommandType.Text;
            string result = Convert.ToString(objCommand.ExecuteScalar());
            objCommand.Dispose();

            if (result != "")
            {
                RecordExists = true;
            }

            return RecordExists;
        }
        catch (SqlException ex)
        {
            ex.Data.Clear();
            return RecordExists;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return RecordExists;
        }
        finally
        {
            CloseConnection();
        }
    }
    # endregion

    #region Routine to Get DataView from SQLCommand
    /*-------------------------------------------------------------
        ' Routine to Get DataView from SQLCommand
        '-------------------------------------------------------------*/
    public DataView GetDataView(string a_strSQLCommand)
    {

        DataView oDV = new DataView();
        try
        {
            DataTable oDT;
            System.Data.SqlClient.SqlDataReader oSQLDR = GetSQLDataReader(a_strSQLCommand);
            oDT = new DataTable("tmpTable");
            DataRow oDR;
            for (int iCount = 0; iCount < oSQLDR.FieldCount - 1; iCount++)
            {
                oDT.Columns.Add(oSQLDR.GetName(iCount), oSQLDR.GetFieldType(iCount));
            }
            while (oSQLDR.Read())
            {
                oDR = oDT.NewRow();
                for (int iCount = 0; iCount < oSQLDR.FieldCount - 1; iCount++)
                {
                    oDR.ItemArray[iCount] = oSQLDR.GetValue(iCount);
                }
                oDT.Rows.Add(oDR);
            }
            oSQLDR.Close();
            oDV.AllowDelete = false;
            oDV.AllowEdit = false;
            oDV.AllowNew = false;

        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
        return oDV;
    }
    #endregion

    #region Routine to Fetch All records in Table,Specifying the Table Name
    /*-----------------------------------------------------
         * Routine to Fetch All records in Table
         * Specifying the Table Name
         * ----------------------------------------------------*/
    public DataTable GetAllRecordsByTableName(string TableName)
    {
        DataTable dt = new DataTable();
        string sql;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            sql = "select * from " + TableName;

            SqlCommand cmd = new SqlCommand(sql, myConn);
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader, LoadOption.OverwriteChanges);
            reader.Close();
            return dt;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
        finally
        {
            CloseConnection();
        }
    }
    #endregion

    #region Routine to Fetch Paarticular record in a Table,Specifying the Table Name and KeyValues
    /*-----------------------------------------------------
         * Routine to Fetch Paarticular record in a Table
         * Specifying the Table Name and KeyValues
         * ----------------------------------------------------*/
    public DataTable GetRecordsByColumn(string TableName, string KeyName, string KeyValue, bool NeedQuotes)
    {
        DataTable dt = new DataTable();
        string sql;
        try
        {
            bool AttemptToConnect = OpenSQLConnection();
            sql = "select * from [" + TableName + "] where " + KeyName + " = ";
            if (NeedQuotes)
                sql += "'" + KeyValue + "'";
            else
                sql += KeyValue;
            SqlCommand cmd = new SqlCommand(sql, myConn);
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader, LoadOption.OverwriteChanges);
            reader.Close();
            return dt;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return null;
        }
        finally
        {
            CloseConnection();
        }
    }
    #endregion

    #region Routine to parse and return Fields in SQL statements
    /*-----------------------------------------------------
        ' Routine to parse and return Fields in SQL statements
        '-----------------------------------------------------*/
    public string ParsedFieldName(string a_strFieldName)
    {
        string strRetString = a_strFieldName;
        if (!strRetString.StartsWith("["))
            strRetString = "[" + strRetString;
        if (!strRetString.EndsWith("]"))
            strRetString += "]";
        return strRetString;
    }
    # endregion

    #region to Bind data to Grid
    public string BindtoGrid(GridView grdDefault, string strSql)
    {
        string count = "0";
        try
        {
            DataSet DS = new DataSet();
            DS = GetDataSet(strSql);
            grdDefault.DataSource = DS.Tables[0];
            count = DS.Tables[0].Rows.Count.ToString();
            grdDefault.DataBind();

        }
        catch
        {
            count = "0";
        }
        return count;
    }
    #endregion

    #region to Bind Dropdown
    public void BindToDDL(DropDownList drpexp1, string strQry)
    {
        try
        {
            DataSet ds;
            ds = GetDataSet(strQry);
            drpexp1.DataSource = ds.Tables[0];
            drpexp1.DataTextField = ds.Tables[0].Columns[0].ToString();
            drpexp1.DataValueField = ds.Tables[0].Columns[0].ToString();
            drpexp1.DataBind();
        }
        catch
        {

        }
    }
    #endregion

    #region to Bind data to DataList
    public string BindtoDataList(DataList dlDefault, string strSql)
    {
        string count = "0";
        try
        {
            DataSet DS = new DataSet();
            DS = GetDataSet(strSql);
            dlDefault.DataSource = DS.Tables[0];
            count = DS.Tables[0].Rows.Count.ToString();
            dlDefault.DataBind();

        }
        catch
        {
            count = "0";
        }
        return count;
    }
    #endregion

    public string GetString(string strTable, string strReturnFieldName, string strWhere)
    {
        string strRet = "";
        try
        {

            string strQry = "SELECT " + strReturnFieldName + " FROM " + strTable + " WHERE " + strWhere;
            DataSet DS;
            DS = GetDataSet(strQry);
            if (DS.Tables[0].Rows.Count > 0)
            {
                strRet = DS.Tables[0].Rows[0][0].ToString();
            }
            return strRet;
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            return strRet;
        }
    }


}