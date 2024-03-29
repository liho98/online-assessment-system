﻿<%@ Page Title="OAS | Unauthorized Access" Language="C#" MasterPageFile="~/MasterPage/LoginSite.Master" AutoEventWireup="true" CodeBehind="UnauthorizedAccess.aspx.cs" Inherits="OAS.UnauthorizedAccess" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="loginBox" ContentPlaceHolderID="loginBox" runat="server">

    <div class="box-wrapper">
        <div class="box">
            <a runat="server" href="~/Default.aspx" title="OAS">
                <span>
                    <img runat="server" id="icon" style="width: 35px;" src="~/Content/images/icons_logos/oas_blue.png" alt="Logo"></span>
                <span class="logo-name">&nbsp;O&nbsp;A&nbsp;S<span style="font-size: 8px"> &copy;</span></span>
            </a>

            <script runat="server">
                protected void returnLink_OnClick(object sender, EventArgs e)
                {
                    FormsAuthentication.SignOut();
                    if (Request.QueryString["ReturnURL"] != null)
                    {
                        Response.Redirect(FormsAuthentication.LoginUrl + "?ReturnUrl=" + Request.QueryString["ReturnURL"]);
                    }
                    Response.Redirect(FormsAuthentication.LoginUrl);
                }
            </script>

            <asp:LinkButton ID="returnLink" OnClick="returnLink_OnClick" runat="server" title="Back">
                    <i class="material-icons" style="float:right;margin-top:5px;font-weight:500;font-size:25px;">arrow_back</i>
            </asp:LinkButton>

            <br />
            <br />
            <br />
            <div style="text-align: center">
                <h2>Unauthorized Access</h2>
                <br />
                <br />
                <i class="material-icons" style="font-size: 50px;">warning</i>
            </div>
        </div>
    </div>
</asp:Content>