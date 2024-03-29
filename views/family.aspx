﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="family.aspx.cs" Inherits="POS.views.family" MasterPageFile="~/views/masterPage.Master"%>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $(".navbar .navbar-inner .nav li").removeClass("active");
            $(".navbar .navbar-inner li#family").addClass("active");

            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            /*
            var IU = 'I';
            var ID = -1;
            var isDelete = false;
            */



            $("#btnCancel").click(function () {
                //alert(document.forms[0].name);
                //var theForm = document.forms['#departmentForm'];

                //document.getElementById("departmentForm").submit()
                //document.forms[0].submit();


                clearAllElements();
                return false;
            });



            $("#submit").click(function () {



                //$("#<%=Button1.ClientID %>").click();

                if (window.IU == 'I') {
                    bgColor = $("#colorSelector > div").css("background-color");
                    textColor = $("#colorSelector_text > div").css("background-color");


                    $.post("../Ajax/family.aspx",
                        {
                            deptID: $('#<%=deptDrplst.ClientID %>').val(),
                            sectionID: $('#<%=sectionDrplst.ClientID %>').val(),
                            familyName: $("#familyName").val(),
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: "",
                            bgColor: bgColor,
                            textColor: textColor,
                            costCenter: $("#costCenter").val(),
                            saleAcct: $("#saleAcct").val(),
                            purchaseAcct: $("#purchaseAcct").val(),
                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            PageMethods.saveImage(response);

                            //alert("Data inserted...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data inserted...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();
                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {
                    bgColor = $("#colorSelector > div").css("background-color");
                    textColor = $("#colorSelector_text > div").css("background-color");

                    $.post("../Ajax/family.aspx",
                        {
                            deptID: $('#<%=deptDrplst.ClientID %>').val(),
                            sectionID: $('#<%=sectionDrplst.ClientID %>').val(),
                            familyID: window.ID,
                            familyName: $("#familyName").val(),
                            reference: $("#reference").val(),
                            description: $("#description").val(),
                            image: window.ID,
                            bgColor: bgColor,
                            textColor: textColor,
                            costCenter: $("#costCenter").val(),
                            saleAcct: $("#saleAcct").val(),
                            purchaseAcct: $("#purchaseAcct").val(),
                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            PageMethods.saveImage(window.ID);
                            window.IU = 'I';

                            //alert("Data updated...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data updated...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();
                        }
                    );

                    return false;
                }
            });


        });


        function updateRow(deptID, sectionID, familyID, familyName, reference, description, bgColor, textColor, costCenter, saleAcct, purchaseAcct) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                id = familyID;
                window.IU = 'U';
                window.ID = id;


                $("#<%=deptDrplst.ClientID %>").val(deptID);
                $("#<%=sectionDrplst.ClientID %>").val(sectionID);
                $("#familyName").val(familyName);
                $("#reference").val(reference);
                $("#description").val(description);
                $("#colorSelector > div").css("background-color", bgColor);
                $("#colorSelector_text > div").css("background-color", textColor);
                $("#costCenter").val(costCenter);
                $("#saleAcct").val(saleAcct);
                $("#purchaseAcct").val(purchaseAcct);
                PageMethods.updateRow(id);

                $("#ctl00_MainContent_ImageUploader_imgPreview").load();

                src = $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src");
                src = "../uploadedImg/family/" + id + ".jpg";
                $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
                $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");

                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


                //alert(CodeCarvings.Wcs.Piczard.Upload.SimpleImageUpload.get_hasImage("<% =CodeCarvings.Piczard.Web.Helpers.JSHelper.EncodeString(this.ImageUploader.ClientID) %>"));
            }
        }


        function deleteRow(deptID, sectionID, familyID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/family.aspx",
                    {
                        deptID: deptID,
                        sectionID: sectionID,
                        familyID: familyID,
                        StatementType: 'Delete'
                    },

                    function (response) {
                        //alert(response);
                        //PageMethods.SendForm(response);
                        //PageMethods.saveImage(window.ID);

                        //alert("Data deleted...");
                        $(document).trigger("add-alerts", [
                                {
                                    'message': "Data deleted...",
                                    'priority': 'error'
                                }
                              ]);
                    }
                );
            } else {
                // Do nothing!
            }

            //clearAllElements();
            return false;
        }

        function clearAllElements() {
            window.IU = 'I';
            window.ID = -1;
            window.isDelete = false;

            $('#<%=deptDrplst.ClientID %>').val(-1);
            $('#<%=sectionDrplst.ClientID %>').val(-1);
            $("#familyName").val(null);
            $("#reference").val(null);
            $("#description").val(null);
            $("#colorSelector > div").css("background-color", "transparent");
            $("#colorSelector_text > div").css("background-color", "transparent");
            $("#costCenter").val(null);
            $("#saleAcct").val(null);
            $("#purchaseAcct").val(null);

            src = "../uploadedImg/" + "dummy" + ".jpg";
            $("#ctl00_MainContent_ImageUploader_imgPreview").attr("src", src);
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("height", "auto");
            $("#ctl00_MainContent_ImageUploader_imgPreview").css("width", "auto");
        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="alertBox" data-alerts="alerts"  data-fade="3000"></div>



        <div class="row-fluid">
            <div class="span6">
                <form class="navbar-form pull-left" id="familyForm" action="family.aspx">

                    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true">
                            </asp:ScriptManager>  

                    <div id="family">
                <table>
                    <tr>
                        <td><label>Department Name</label></td>
                        <td><!-- <input id="deptName" type="text" placeholder="Department Name" class="span2" /> -->
                            <asp:DropDownList ID="deptDrplst" runat="server"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Section Name</label></td>
                        <td><!-- <input id="deptName" type="text" placeholder="Department Name" class="span2" /> -->
                            <asp:DropDownList ID="sectionDrplst" runat="server"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td><label>Family Name</label></td>
                        <td><input id="familyName" type="text" placeholder="Family Name" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Reference</label></td>
                        <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Image</label></td>
                        <td>

                                      


                             <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                                <ContentTemplate>
                             
                                <div class="pageContainer">  
                           
                                    <ccPiczardUC:SimpleImageUpload ID="ImageUploader" runat="server" 
                                        Width="500px"
                                        AutoOpenImageEditPopupAfterUpload="true"
                                        Culture="en" 
                                     EnableEdit="False" />
                
                
                                </div>
                            
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </td>
                    </tr>

                    <tr>
                        <td><label>Background Coloror</label></td>
                        <td><div id="colorSelector"><div></div></div></td>
                    </tr>

                    <tr>
                        <td><label>Text Color</label></td>
                        <td><div id="colorSelector_text"><div></div></div></td>
                    </tr>

                    <tr>
                        <td><label>Cost Center</label></td>
                        <td><input id="costCenter" type="text" placeholder="Cost Center" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Sale Acct</label></td>
                        <td><input id="saleAcct" type="text" placeholder="Sale Acct" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Purchase Acct</label></td>
                        <td><input id="purchaseAcct" type="text" placeholder="Purchase Acct" class="span2" /></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            

                            <div id="submit" class="btn" >Submit</div>
                            <asp:Button ID="Button1" runat="server" class="btn" Text="Button"  Visible="false"/>
                            <div id="btnCancel" class="btn" >Cancel</div>
                            
                        </td>
                    </tr>                  
                                   <!-- Item Name -->
                </table>
            
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>
            </div>

            <div class="span6">

            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                <ContentTemplate>

                    <asp:Panel ScrollBars="Vertical" Height="300" runat="server">
                        <asp:ListView ID="lstvFamily" runat="server">
            <LayoutTemplate >
                <table class="table table-condensed">
                    <tr>
                        <td style="background:#00ffff; font-size:medium">Section Name List</td>
                    </tr>
                    <tr>
                        <td><asp:PlaceHolder id="itemPlaceholder" runat="server" /></td>
                    </tr>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr onmouseup="updateRow(<%#Eval("deptID") %>, <%#Eval("sectionID") %>, <%#Eval("familyID") %>, '<%#Eval("familyName") %>', '<%#Eval("reference") %>', '<%#Eval("description") %>', '<%#Eval("bgColor") %>', '<%#Eval("textColor") %>', '<%#Eval("costCenter") %>', '<%#Eval("saleAcct") %>', '<%#Eval("purchaseAcct") %>') ;">
                    <td>
                        <asp:Label ID="lblDeptID" runat="Server" Text='<%#Eval("familyID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDeptName" runat="Server" Text='<%#Eval("familyName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("deptID") %>, <%#Eval("sectionID") %>, <%#Eval("familyID") %>)" style="cursor:pointer">Delete</td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>

            </div>
        </div>
                    
        
                
                 
        
       
                


        
       
        

        
</asp:Content>
