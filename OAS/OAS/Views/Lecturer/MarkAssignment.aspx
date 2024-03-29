﻿<%@ Page Title="OAS | Mark Assignment" Language="C#" MasterPageFile="~/MasterPage/MainSite.Master" Async="true" AutoEventWireup="true" CodeBehind="MarkAssignment.aspx.cs" Inherits="OAS.Views.Lecturer.MarkAssignment" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">

    <!-- Overide the #contentBody height value default is 1.8 -->
    <script>
        $(document).ready(function () {
            dynamicSetHeight(1.2);
            setLeftTriangle();
        });

        $(window).on('resize', function () {
            var instance = $.fn.deviceDetector;
            if (instance.isDesktop()) {
                dynamicSetHeight(1.2);
            }
            if ($(window).outerWidth() > 958) {
                setLeftTriangle();
            } else {
                document.getElementById("triangle-div").style.left = "";
            }
        });

        $(document).ready(function () {
            $('#contentBody_datatables').DataTable({
                pageLength: 1,
                paging: false,
                //stateSave: true,
                "scrollY": "100%",
                "scrollCollapse": true,
                "searching": false,
                "ordering": false,
                "lengthChange": false,
                "columnDefs": [{ "width": "10%", "targets": 0 }],
                "dom": '<"top"i>rt<"bottom"flp><"clear">',
                "oLanguage": {
                    "sInfo": "Showing Question _START_ of total _TOTAL_ Question."
                },
                fixedColumns: { heightMatch: 'none' }

            });
        });

        var table = $('#contentBody_datatables').DataTable();

        // Sort by column 1 and then re-draw
        table
            .draw(false);
    </script>

    <style>
        video {
            opacity: 0.6;
        }

        .background-image {
            filter: brightnes(250%);
            background-size: cover;
            background-position: center;
        }

        .box-wrapper {
            background-color: #fff;
            position: absolute;
            top: 50%;
            right: 0;
            bottom: 0;
            left: 50%;
            width: 85%;
            height: 90%;
            transform: translate(-50%, -50%);
            user-select: none;
        }

        .box {
            background-color: #fff;
            width: 70%;
            height: 100%;
            position: absolute;
            top: 50%;
            right: 0;
            bottom: 0;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: left;
        }

        input[type=submit], input[type=reset], button {
            border-color: #0067b8;
            background-color: #0067b8;
            color: #fff;
            padding: 4px 12px 4px 12px;
            height: 32px;
            border-width: 1px;
            border-style: solid;
            cursor: pointer;
            text-overflow: ellipsis;
            touch-action: manipulation;
            -webkit-appearance: button;
            float: right;
            margin-left: 10px;
        }

        .box td {
            padding: 0 !important;
        }

        #contentBody_tableDiv {
            border: 1px solid rgba(0,0,0,0.2);
        }

        .dataTables_info {
            padding: 10px;
        }

        textarea {
            width: 100%;
            height: 80px;
            padding: 12px 20px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            resize: none;
            margin-top: 4px;
        }

        input[type=text] {
            width: 100%;
            height: 20px;
            padding: 12px 20px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            margin-bottom: 20px;
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
        #contentBody_ValidationSummary{
            display:inline-block;
        }
    </style>
</asp:Content>

<asp:Content ID="videoSource" ContentPlaceHolderID="videoSource" runat="server">
    <source runat="server" type="video/mp4" src="~/Content/videos/bg_video2.mp4">
    <script>
        var path = window.location.protocol + "//" + window.location.host;
        document.getElementsByClassName("background-image")[0].style.backgroundImage = "url('" + path + "/Content/images/background_images/login_signup_bg.jpg')";
    </script>
</asp:Content>

<asp:Content ID="backgoundText" ContentPlaceHolderID="backgoundText" runat="server">
    <!-- background text -->
    <div style="position: fixed; top: 14%; width: 100%; color: #fff">
        <div id="sloganDiv" style="text-align: center;">
            <div style="margin: 20px;">
                <span id="slogan">Mark Assignment</span>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="contentBody" ContentPlaceHolderID="contentBody" runat="server">
    <!-- content start -->
    <div id="bodyContent" style="background-color: #fff; border-bottom: 1px solid rgb(205,205,205); z-index: 1">
        <div class="content">

            <div class="box-wrapper">
                <div class="box" style="width: 100%; top: 40%; height: 75%; background-color: ;">

                    <asp:RequiredFieldValidator ID="CommentTextboxRequiredFieldValidator"
                        runat="server"
                        ControlToValidate="CommentTextbox"
                        ErrorMessage="Please fill the Comment field." style="display:none"
                        ValidationGroup="ValidateGroup"
                        Display="Static" ForeColor="Red" CssClass="errorMsg" />

                    <asp:RequiredFieldValidator ID="ScoreTextboxRequiredFieldValidator"
                        runat="server"
                        ControlToValidate="ScoreTextbox"
                        ErrorMessage="Please fill the Score field." style="display:none"
                        ValidationGroup="ValidateGroup"
                        Display="Static" ForeColor="Red" CssClass="errorMsg" />

                      <asp:RangeValidator id="ScoreTextboxRangeFieldValidator"
                           ControlToValidate="ScoreTextbox"
                           MinimumValue="0.0"
                           MaximumValue="100.0" 
                           Type="Double" 
                           ValidationGroup="ValidateGroup" style="display:none"
                           ErrorMessage="The score must be from 0 to 100."
                           Display="Static" ForeColor="Red" CssClass="errorMsg"
                           runat="server"/>

                    <div style="width: 100%;height:30px;">
                        Status : <asp:Label ID="Message" Text="" runat="server" Style="text-align: center; font-weight: 500; font-size: 14px; letter-spacing: 0.5px;"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="ValidateGroup" 
                            DisplayMode="BulletList" ShowSummary="true"  />

                    </div>
                    <div id="tableDiv" runat="server" style="height: 100%; overflow: scroll;" class="reset-parent bootstrap-iso">
                        <!-- Any HTML here will be styled with Bootstrap CSS -->
                        <asp:PlaceHolder ID="MarkAssignmentTablePlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                    <div>
                        <asp:TextBox ID="CommentTextbox" placeholder="Enter your comment here." TextMode="MultiLine" runat="server"></asp:TextBox>
                        <asp:TextBox ID="ScoreTextbox" placeholder="Enter Score Within the range (0-100)" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" ValidationGroup="ValidateGroup" OnClick="SubmitButton_OnClick" OnClientClick="return confirm('Are you sure to submit?');" />
                    <input id="Reset" type="reset" value="reset" />
                </div>
            </div>

        </div>
    </div>
    <!-- content end -->

</asp:Content>
