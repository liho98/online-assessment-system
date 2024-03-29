﻿<%@ Page Title="OAS | Sign up" Language="C#" MasterPageFile="~/MasterPage/LoginSite.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OAS.SignUp" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">

    <style>
        input[type=text], input[type=password], .input {
            border-width: 1px;
            border-color: #666;
            border-color: rgba(0,0,0,.3);
            height: 35px;
            outline: none;
            border-radius: 0;
            -webkit-border-radius: 0;
            width: 100%;
            border-top-width: 0;
            border-left-width: 0;
            border-right-width: 0;
            font-size: 13px;
            font-weight: 100;
            margin-top: 10px;color:black!important;
            -webkit-transition: all 1s linear;
            transition: all 1s linear;
        }

            input[type=text]:focus, input[type=password]:focus {
                border-color: rgb(102,102,255);
            }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1s;
            animation-name: fade;
            animation-duration: 1s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        .selectRoleButton {
            all: unset;
            display: block;
            text-align: center;
            vertical-align: middle;
            display: inline-block;
            line-height: 3;
            border-color: #0067b8;
            background-color: #0067b8;
            color: #fff;
            border-width: 1px;
            border-style: solid;
            cursor: pointer;
            text-overflow: ellipsis;
            touch-action: manipulation;
            bottom: 0;
            right: 0;
            width: 100%;
            height: 50px !important;
        }

        .errorMsg {
            position: absolute;
            font-weight: 500;
            font-size: 11px;
            letter-spacing: 0.5px;
            display: inline-block;
            margin-top: 38px;
            max-width: 235px;
        }
        #loginBox_CalendarUserControl_Calendar {
            color: #fff;
            padding: 60px 40px 80px 40px;
            width: 100%;
            height: ;
            box-shadow: 0px 2px 6px rgba(2,2,2,0.2);
            position: relative;
            text-decoration: none !important;
            font-family: 'Avenir', sans-serif;
            background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
            background-size: 400% 400%;
            animation: Gradient 15s ease infinite;
            border: none;
            font-size: 13px;
            position: absolute;
            z-index: 1;
            transform: translateY(-100%);
        }

            #loginBox_CalendarUserControl_Calendar tr td:first-child {
                background-color: transparent !important;
                font-size: 15px;
                font-weight: 700;
            }

            #loginBox_CalendarUserControl_Calendar tbody tr:first-child td {
                padding: 10px;
            }

            #loginBox_CalendarUserControl_Calendar a {
                color: #fff !important;
                text-decoration: none;
            }

        @keyframes Gradient {
            0% {
                background-position: 0% 50%
            }

            50% {
                background-position: 100% 50%
            }

            100% {
                background-position: 0% 50%
            }
        }
        ul{
            padding: 0;
        }
        li{
            display:none;
        }
        ul li:first-child{
            list-style-type: none;
            display:block;
        }
    </style>

</asp:Content>

<asp:Content ID="loginBox" ContentPlaceHolderID="loginBox" runat="server">

    <div runat="server" id="selectBox" class="box-wrapper selectBox fade" style="height: 390px!important">
        <div class="box" style="height: 75%">
            <a runat="server" href="~/Default.aspx" title="OAS">
                <span>
                    <img runat="server" id="Img1" style="width: 35px;" src="~/Content/images/icons_logos/oas_blue.png" alt="Logo"></span>
                <span class="logo-name">&nbsp;O&nbsp;A&nbsp;S<span style="font-size: 8px"> &copy;</span></span>
            </a>

            <h2 style="text-align: center; margin-bottom: 10px;">Create account</h2>
            <br />
            <br />
            <asp:LinkButton ID="studentButton" OnClick="studentButton_OnClick" runat="server" CssClass="selectRoleButton fade">
                Student
            </asp:LinkButton>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LecturerButton" OnClick="lecturerButton_OnClick" runat="server" CssClass="selectRoleButton fade">
                Lecturer
            </asp:LinkButton>
        </div>
    </div>

    <div runat="server" id="userBox" class="box-wrapper fade">
        <div class="box" style="height: 85%!important">
            <a runat="server" href="~/Default.aspx" title="OAS">
                <span>
                    <img runat="server" id="icon" style="width: 35px;" src="~/Content/images/icons_logos/oas_blue.png" alt="Logo"></span>
                <span class="logo-name">&nbsp;O&nbsp;A&nbsp;S<span style="font-size: 8px"> &copy;</span></span>
            </a>

            <asp:LinkButton ID="returnLink" OnClick="returnLink_OnClick" runat="server" title="Back">
                    <i class="material-icons" style="float:right;margin-top:5px;font-weight:500;font-size:25px;">arrow_back</i>
            </asp:LinkButton>

            <asp:RequiredFieldValidator ID="userIDRequiredFieldValidator"
                runat="server"
                ControlToValidate="userID"
                ErrorMessage="Please fill the User ID field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator"
                runat="server"
                ControlToValidate="firstName"
                ErrorMessage="Please fill the First Name field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator"
                runat="server"
                ControlToValidate="lastName"
                ErrorMessage="Please fill the Last Name field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:RequiredFieldValidator ID="emailRequiredFieldValidator"
                runat="server"
                ControlToValidate="email"
                ErrorMessage="Please fill the Email field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator"
                runat="server"
                ControlToValidate="password"
                ErrorMessage="Please fill the Password field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:RequiredFieldValidator ID="confirmPasswordRequiredValidator"
                runat="server"
                ControlToValidate="confirmPassword"
                ErrorMessage="Please fill the confirm password field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <asp:CompareValidator ID="confirmPasswordCompareValidator" runat="server" ControlToValidate="confirmPassword" ControlToCompare="password"
                Display="Static" ForeColor="red" ErrorMessage="Confirm password must match password." style="display:none"
                ValidationGroup="ValidateGroup" CssClass="errorMsg"></asp:CompareValidator>

            <asp:RequiredFieldValidator ID="contactNoRequiredFieldValidator"
                runat="server"
                ControlToValidate="contactNo"
                ErrorMessage="Please enter the Contact No. field." style="display:none"
                ValidationGroup="ValidateGroup"
                Display="Static" ForeColor="Red" CssClass="errorMsg" />

            <% if (role.Text == "Students")
                {
            %>
            <h2 style="margin-bottom: 10px;">Create Student Account</h2>
            <%}
                else
                { %>
            <h2 style="margin-bottom: 10px;">Create Lecturer Account</h2>
            <%} %>

            <asp:TextBox ID="userID" runat="server" placeholder="User ID" autofocus="autofocus"></asp:TextBox>
            <asp:TextBox ID="firstName" runat="server" placeholder="First name" Style="width: 49%"></asp:TextBox>
            <asp:TextBox ID="lastName" runat="server" placeholder="Last name" Style="width: 49%; float: right"></asp:TextBox>
            <asp:TextBox ID="email" runat="server" placeholder="Email address"></asp:TextBox>
            <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" ValidationGroup="ValidateGroup" placeholder="Confirm password"></asp:TextBox>

            <asp:TextBox ID="role" runat="server" Visible="false"></asp:TextBox>

            <asp:DropDownList ID="gender" CssClass="input" Style="color: rgba(0,0,0,0.6); font-size: 13px;" runat="server">
                <asp:ListItem Selected="True">Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="contactNo" runat="server" placeholder="Contact No."></asp:TextBox>
            <%-- 
            <asp:TextBox ID="dateOfBirth" runat="server" required="required" CssClass="input" Style="color: rgba(0,0,0,0.6); font-size: 13px;"  placeholder="Date of Birth" onfocus="(this.type='date')"></asp:TextBox>
            --%>
            <uc:Calendar runat="server" ID="CalendarUserControl" OnCalendarVisibilityChanged="CalendarUserControl_OnCalendarVisibilityChanged" />

            <% if (role.Text == "Students")
                {
            %>
            <asp:DropDownList ID="ProgramCode" CssClass="input" Style="color: rgba(0,0,0,0.6); font-size: 13px;" runat="server">
                <asp:ListItem Selected="True">RSF</asp:ListItem>
                <asp:ListItem>RSD</asp:ListItem>
                <asp:ListItem>REI</asp:ListItem>
                <asp:ListItem>RIP</asp:ListItem>
            </asp:DropDownList>
            <%}
                else
                { %>
            <asp:DropDownList ID="position" CssClass="input" Style="color: rgba(0,0,0,0.6); font-size: 13px;" runat="server">
                <asp:ListItem Selected="True">Lecturer</asp:ListItem>
                <asp:ListItem>Senior Lecturer</asp:ListItem>
                <asp:ListItem>Principal Lecturer</asp:ListItem>
            </asp:DropDownList>
            <%} %>

            <asp:Label ID="invalidDetailsMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
            <div id="loginLink" runat="server" visible="false">
                <a runat="server" href="~/Login.aspx" style="color:#0067b8;text-decoration:none;font-weight: 500;font-size: 11px;letter-spacing: 0.5px;margin-left:0px">Login</a>
            </div>

            <asp:Button ID="signUpButton" runat="server" Text="Sign up" OnClick="SignUpButton_Click" ValidationGroup="ValidateGroup" />

            <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="ValidateGroup" 
                DisplayMode="BulletList" ShowSummary="true"  />

        </div>
    </div>
</asp:Content>

