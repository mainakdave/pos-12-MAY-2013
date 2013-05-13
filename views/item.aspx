<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="POS.views.item" MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            $(".navbar .navbar-inner .nav li").removeClass("active");
            $(".navbar .navbar-inner li#item").addClass("active");

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


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineName: $("#lineName").val(),
                            description: $("#description").val(),
                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(response);

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


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineID: window.ID,
                            lineName: $("#lineName").val(),
                            description: $("#description").val(),
                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(window.ID);
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


        function updateRow(brandID, lineID, lineName, description) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = lineID;

                $("#<%=brandDrplst.ClientID %>").val(brandID);
                $("#lineID").val(lineID);
                $("#lineName").val(lineName);
                $("#description").val(description);


                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


            }
        }


        function deleteRow(brandID, lineID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/line.aspx",
                    {
                        brandID: brandID,
                        lineID: lineID,
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

            $('#<%=brandDrplst.ClientID %>').val(-1);
            $("#lineName").val(null);
            $("#description").val(null);


        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="alertBox" data-alerts="alerts"  data-fade="3000"></div>


        <div class="row-fluid">
            <div class="span6">
                <form class="navbar-form pull-left" id="itemForm" action="item.aspx">

                    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true">
                    </asp:ScriptManager>  

                    <div id="item">
                        <table>
                            <tr>
                                <td><label>Reference</label></td>
                                <td><input id="reference" type="text" placeholder="Reference" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Description</label></td>
                                <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Short Description</label></td>
                                <td><input id="shortDescription" type="text" placeholder="Short Description" class="span2" /></td>
                            </tr>

                            <tr>
                                <td><label>Department</label></td>
                                <td><asp:DropDownList ID="deptDrplst" runat="server" 
                                        onselectedindexchanged="deptDrplst_SelectedIndexChanged" 
                                        AutoPostBack="True"></asp:DropDownList></td>
                            </tr>

                            <tr>
                                <td><label>Section</label></td>
                                <td><asp:DropDownList ID="sectionDrplst" runat="server" 
                                        onselectedindexchanged="sectionDrplst_SelectedIndexChanged" 
                                        AutoPostBack="True"></asp:DropDownList></td>
                            </tr>

                            <tr>
                                <td><label>Family</label></td>
                                <td><asp:DropDownList ID="familyDrplst" runat="server"></asp:DropDownList></td>
                            </tr>
                            
                            <tr>
                                <td><label>Brand</label></td>
                                <td><asp:DropDownList ID="brandDrplst" runat="server" 
                                        onselectedindexchanged="brandDrplst_SelectedIndexChanged" 
                                        AutoPostBack="True"></asp:DropDownList></td>
                            </tr>

                            <tr>
                                <td><label>Line</label></td>
                                <td><asp:DropDownList ID="lineDrplst" runat="server"></asp:DropDownList></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td>
                            

                                    <div id="submit" class="btn" >Submit</div>
                                    <asp:Button ID="Button1" runat="server" class="btn" Text="Button" Visible="false"/>
                                    <div id="btnCancel" class="btn" >Cancel</div>
                            
                                </td>
                            </tr>                  
                                   <!-- Item Name -->
                        </table>

                        <div class="tabbable"> <!-- Only required for left/right tabs -->
                            <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">Properties</a></li>
                            <li><a href="#tab2" data-toggle="tab">Prices/Formats</a></li>
                            <li><a href="#tab3" data-toggle="tab">Kitchen Situations</a></li>
                            <li><a href="#tab4" data-toggle="tab">Modifiers</a></li>
                            <li><a href="#tab5" data-toggle="tab">Recipes</a></li>
                            <li><a href="#tab6" data-toggle="tab">Stocks</a></li>
                            <li><a href="#tab7" data-toggle="tab">Short Menus</a></li>
                            <li><a href="#tab8" data-toggle="tab">Comments</a></li>
                          </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                  <p>Properties Section</p>
                                </div>
                                <div class="tab-pane" id="tab2">
                                  <p>Prices/Formats Section</p>
                                </div>
                                <div class="tab-pane" id="tab3">
                                  <p>Kitchen Situations Section</p>
                                </div>
                                <div class="tab-pane" id="tab4">
                                  <p>Modifiers Sections</p>
                                </div>
                                <div class="tab-pane" id="tab5">
                                  <p>Recipes Section</p>
                                </div>
                                <div class="tab-pane" id="tab6">
                                  <p>Stocks Sections</p>
                                </div>
                                <div class="tab-pane" id="tab7">
                                  <p>Short Menus</p>
                                </div>
                                <div class="tab-pane" id="tab8">
                                  <p>Comments</p>
                                </div>
                          </div>
                        </div>

                    </div>
                </form>
            </div>

            <div class="span6">

            </div>
        </div>
                    
        
                
                 
        
       
                


        
       
        

        
</asp:Content>
