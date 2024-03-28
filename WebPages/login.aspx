<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PublicMasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="WebPages_login" %>

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
                        <asp:Label ID="Label10" runat="server" Text="LOGIN" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </div> 
                    </div>
    
<br />
 <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
           
            <asp:Label ID="Label1" runat="server" Text="UserName" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text=":" Font-Bold="true"></asp:Label>
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
            <asp:Label ID="Label5" runat="server" Text="Password" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text=":"></asp:Label>
        </div>
        
        <div class="col-md-5">
            <asp:TextBox ID="TextPassword" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-2">
        </div>
    </div>
<br />

    <div class="row">
        <div class="col-md-5">
        </div>
        <div class="col-md-4">
            <asp:Button ID="ButtonLogin" runat="server" Text="login" style="background-color:sandybrown" CssClass="btn-primary" OnClick="ButtonLogin_Click"  />
             <asp:Button ID="ButtonReset"  runat="server" Text="Reset"  style="background-color:sandybrown" CssClass="btn-primary" Font-Bold="true" OnClick="ButtonReset_Click" />

            <asp:LinkButton ID="LinkButtonForgot" runat="server" OnClick="LinkButtonForgot_Click">Forgot Password</asp:LinkButton>
        </div>
        <div class="col-md-2">
        </div>
    </div>
      
    <br />
        </div>
            <div class="col-md-1">

            </div>
            </div>

        </div>
    <br />
      
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>


