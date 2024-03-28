<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PublicMasterPage.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="WebPages_forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <br />
     <div class="container">
        
        <div class="row">
            <div class="col-md-1"></div>
    <div class="col-md-10" style="border-style:double; border-color:black;border-width:thick;border-spacing:initial">
         <div class="row">
                    <div class="col-md-12 col-xs-12" style="text-align:center;">
                        <asp:Label ID="Label10" runat="server" Text="Forgot Password" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </div> 
                    </div>
    <br />
         <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
           
            <asp:Label ID="Label5" runat="server" Text="UserName" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text=":" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-2">
        </div>
    </div>
    <br />
    <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
           
            <asp:Label ID="Label1" runat="server" Text="Reset Password" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text=":" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextResetPassword" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-2">
        </div>
    </div>
    <br />
    <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
           
            <asp:Label ID="Label3" runat="server" Text="Confirm Password" Font-Bold="true"></asp:Label>
            <asp:label id="Label4" runat="server" text=":" font-bold="true" ></asp:label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextConfirm" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>
        <div class="col-md-2">
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-5">
        </div>
        <div class="col-md-4">
            <asp:Button ID="ButtonOK" runat="server" Text="OK" style="background-color:#b7c268" CssClass="btn-primary"  Font-Bold="true" />
             
        </div>
        <div class="col-md-2">
        </div>
        </div>
  
        <br />
        </div>
            </div>
         </div>
         <br />


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>

