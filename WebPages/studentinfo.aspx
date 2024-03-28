<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage(1).master" AutoEventWireup="true" CodeFile="studentinfo.aspx.cs" Inherits="WebPages_studentinfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                 };
                 reader.readAsDataURL(input.files[0]);
                 }
             }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="container-fluid" style="background-color: #e6d968">
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" style="border: 4px solid black; padding: 20px">

                    <div class="row">
                        <div class="col-md-12 col-xs-12" style="text-align: center;">
                            <asp:Label ID="Label10" runat="server" Text="STUDENT INFO" Font-Bold="true" Font-Size="Large"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div id="Add" runat="server" visible="false">
                        <div class="row">
                            <div class="col-md-10">
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="ButtonView" runat="server" Text="View" Style="background-color: #b7c268" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="ButtonView_Click" />
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label26" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text=":" Font-Bold="true"></asp:Label>

                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextName" runat="server" CssClass="form-control" CausesValidation="false" ></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True" ErrorMessage="Enter Name"
                                    ControlToValidate="TextName" CausesValidation="false"  ></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label27" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="USN" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextUSN" CssClass="form-control" runat="server" CausesValidation="false" ></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" ErrorMessage="Enter USN"
                                    ControlToValidate="TextUSN" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label28" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="DOB" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextDOB" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>
                                

 <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="TextDOB" Format="dd/MM/yyyy" PopupButtonID="ImgStartDate">
                            </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ErrorMessage="Enter DOB "
                                    ControlToValidate="TextDOB" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label29" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text="MobileNo" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextMobile" runat="server" CssClass="form-control" MaxLength="10" CausesValidation="false"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                    FilterType="Numbers" ValidChars=" .'"
                                    TargetControlID="TextMobile">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ErrorMessage="Enter Mobile Number" ControlToValidate="TextMobile"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ControlToValidate="TextMobile" ErrorMessage="Enter Valid Mobile Number"
                                    ValidationExpression="[0-9]{10}" CausesValidation="false"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label30" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label23" runat="server" Text="Email ID" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label24" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server"
                                    FilterType="Numbers,LowercaseLetters,Custom" ValidChars=".@"
                                    TargetControlID="TextBoxEmail">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail"
                                    CssClass="LabelStyleRequired" ErrorMessage="Enter Valid Email Id" SetFocusOnError="True"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                                </asp:RegularExpressionValidator>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ErrorMessage="Enter Email Id"
                                    ControlToValidate="TextBoxEmail" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-5 aligntext ">
                                <asp:Label ID="Label25" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="LblPhoto" runat="server" Text="Upload Photo :" Style="font-size: 16px;" ForeColor="#565029" Font-Bold="true"></asp:Label>
                                <br />
                                <asp:Label ID="lblP" runat="server" Text="(Photo Size Max 2MB & Format: .png,.jpg,.jpeg)" ForeColor="Blue"></asp:Label><br />
                                <asp:Label ID="lblPho" runat="server" Text="(Once you select file, Please Wait for upload)" ForeColor="blue"></asp:Label>
                                 <asp:Label ID="lblfile" runat="server" Text="lblfile" Visible="false" ForeColor="blue"></asp:Label>
                            </div>
                            <div class="col-md-5 ">
                                <asp:FileUpload ID="filephoto" onchange=" ShowImagePreview(this);" runat="server" CausesValidation="false"></asp:FileUpload>
                                <a id="A2" runat="server" visible="false" target="_blank"></a>
                                <br />
                                <asp:Image ID="PreviewImage" runat="server" Width="140px" ImageUrl="../ASPX_Images/no-image-icon-15.png" />
                                <a id="A1" runat="server" visible="false" target="_blank"></a>
                                <br />
                                <asp:Label ID="lblPath" runat="server" CssClass="LabelStyles" Visible="true"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" SetFocusOnError="True" ErrorMessage="Upload Photo"
                                    ControlToValidate="filephoto" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />

                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label31" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label50" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextAddress" TextMode="MultiLine" runat="server" CssClass="form-control" Width="100%" CausesValidation="false"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="True" ErrorMessage="Enter Address"
                                    ControlToValidate="TextAddress" CausesValidation="false" ></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label32" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label11" runat="server" Text="Gender" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label12" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:RadioButtonList ID="RadioGender" runat="server" CellSpacing="10" Width="50%" RepeatDirection="Horizontal" CausesValidation="false">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="True" ErrorMessage="Select Gender"
                                    ControlToValidate="RadioGender" CausesValidation="false"></asp:RequiredFieldValidator>


                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label33" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label13" runat="server" Text="Father'sName:" Font-Bold="true"></asp:Label>
                                <%--      <asp:Label ID="Label14" runat="server" Text=":" Font-Bold="true"></asp:Label>--%>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextFather" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" SetFocusOnError="True" ErrorMessage="Enter Father's Name"
                                    ControlToValidate="TextFather" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label34" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label15" runat="server" Text="Mother'sName:" Font-Bold="true"></asp:Label>
                                <%-- <asp:Label ID="Label16" runat="server" Text=":" Font-Bold="true"></asp:Label>--%>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextMother" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" SetFocusOnError="True" ErrorMessage="Enter Mother's Name"
                                    ControlToValidate="TextMother" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label36" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label17" runat="server" Text="Religion" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label51" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-5">
                                <asp:RadioButtonList ID="RadioReligion" runat="server" CellSpacing="10" Width="50%" RepeatColumns="2" CausesValidation="false">
                                    <asp:ListItem>Hindu</asp:ListItem>
                                    <asp:ListItem>Christian</asp:ListItem>
                                    <asp:ListItem>Islam</asp:ListItem>
                                    <asp:ListItem>Jain</asp:ListItem>
                                    <asp:ListItem>Sikh</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" SetFocusOnError="True" ErrorMessage="Select Religion"
                                    ControlToValidate="RadioReligion" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label21" runat="server" Text="Hobbies" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label22" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-5">
                                <asp:CheckBoxList ID="CheckBoxHobbies" runat="server" CellSpacing="20" Width="70%" RepeatColumns="2" CausesValidation="false">
                                    <asp:ListItem>Dancing</asp:ListItem>
                                    <asp:ListItem>Drawing</asp:ListItem>
                                    <asp:ListItem>Gardening</asp:ListItem>
                                    <asp:ListItem>Cooking</asp:ListItem>
                                    <asp:ListItem>Reading</asp:ListItem>
                                    <asp:ListItem>Poetry</asp:ListItem>
                                    <asp:ListItem>Listening to Music</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:CheckBoxList>

                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label37" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label38" runat="server" Text="Semester" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label39" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:DropDownList ID="DropDownSem" runat="server" CssClass="form-control" CausesValidation="false">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>I</asp:ListItem>
                                    <asp:ListItem>II</asp:ListItem>
                                    <asp:ListItem>III</asp:ListItem>
                                    <asp:ListItem>IV</asp:ListItem>
                                    <asp:ListItem>V</asp:ListItem>
                                    <asp:ListItem>VI</asp:ListItem>
                                    <asp:ListItem>VII</asp:ListItem>
                                    <asp:ListItem>VIII</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" SetFocusOnError="True" ErrorMessage="Select Semester"
                                    ControlToValidate="DropDownSem" InitialValue="--Select--" CausesValidation="false"></asp:RequiredFieldValidator>



                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label35" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text="Branch" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label20" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:DropDownList ID="DropDownBranch" runat="server" CssClass="form-control" CausesValidation="false">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>CS</asp:ListItem>
                                    <asp:ListItem>IS</asp:ListItem>
                                    <asp:ListItem>CC</asp:ListItem>
                                    <asp:ListItem>AI</asp:ListItem>
                                    <asp:ListItem>Civil</asp:ListItem>
                                    <asp:ListItem>ECE</asp:ListItem>
                                    <asp:ListItem>EEE</asp:ListItem>
                                    <asp:ListItem>Mech</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" SetFocusOnError="True" ErrorMessage="Select Branch"
                                    ControlToValidate="DropDownBranch" InitialValue="--Select--" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />

                        <br />
                        <div class="row">
                            <div class="col-md-5">
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" Style="background-color: #b7c268" CssClass="btn-primary" Font-Bold="true" OnClick="ButtonSubmit_Click"/>
                                   <%-- <asp:Button ID="Btnupdate" runat="server" Text="Submit" Style="background-color: #b7c268" CssClass="btn-primary" Font-Bold="true" Visible="false" OnClick="Btnupdate_Click"/>--%>
                                <asp:Button ID="ButtonRefresh1" runat="server" Text="Refresh" Style="background-color: #b7c268" CssClass="btn-primary" Font-Bold="true" CausesValidation="false" OnClick="ButtonRefresh1_Click" />
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>

                        <br />


                        <div class="col-md-1">
                        </div>
                    </div>

                    <div id="divViewMaster" runat="server" visible="true">
                        <div class="row">
                            <div class="col-md-5"></div>
                            <div class="col-md-6">
                                <asp:Button ID="buttonAdd" Text="Add" runat="server" CssClass="btn btn-primary pull-right"
                                    Width="75px" OnClick="buttonAdd_Click" Style="box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)" />
                            </div>
                        </div>
                        <br />
                        <asp:Label ID="lblmid" runat="server" Visible="false" Text="Label"></asp:Label>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Lblvwname" runat="server" Text="Name :" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="TxtName" runat="server" AutoComplete="off" Width="60%" CssClass="form-control Textbox"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                    FilterType="UpperCaseLetters,LowerCaseLetters,Custom" ValidChars=" .'"
                                    TargetControlID="TxtName">
                                </cc1:FilteredTextBoxExtender>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="Lblvwmblno" runat="server" Text="Mobile Number :" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="Txtmblno" runat="server" AutoComplete="off" Width="60%" MaxLength="10" CssClass="form-control Textbox"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                    FilterType="Numbers" ValidChars=" .'"
                                    TargetControlID="Txtmblno">
                                </cc1:FilteredTextBoxExtender>
                            </div>



                            <div class="col-md-6">
                                <br />
                                <asp:Button ID="buttonSearch" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="buttonSearch_Click" Style="box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%); background-color: #beb4a2" />&nbsp
                     
            <asp:Button ID="buttonReset" Text="Reset" runat="server"
                CssClass="btn btn-primary" CausesValidation="false" OnClick="buttonReset_Click" />&nbsp
                            </div>
                            <div class="col-md-2"></div>
                            <br />

                            <div class="row">
                                <div class="col-md-9" align="left">
                                </div>
                                <div class="col-md-3" align="center">
                                    <asp:Label ID="lblCount" runat="server" Font-Bold="true" Text="0 Records Found"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12" align="center" id="DivExport" style="overflow-x: scroll" runat="server">
                                    <br />
                                    <asp:Label ID="lblExportHead" runat="server" Font-Bold="true" Text="STUDENTS DETAILS"
                                        Font-Size="X-Large" Visible="false">
                                    </asp:Label>
                                    <asp:GridView ID="Gvintroducer" runat="server" AutoGenerateColumns="False" CssClass="Admingridtable1"
                                        EmptyDataText="No Records Found!!!" Width="64%" EnableModelValidation="True" OnRowCommand="Gvintroducer_RowCommand">

                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdt" runat="server" CommandName="Edt" CommandArgument='<%# Eval("StudInfo_MasterId") %>' OnClientClick="return confirm('Are you sure you want to Edit? '); aspnetForm.target ='_self'"><i class="fa fa-edit" style="color:#422f0f; font-size:1.5em;"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGname" runat="server" Text='<%# Eval("StudInfo_Name") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="USN">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGUSN" runat="server" Text='<%# Eval("StudInfo_USN") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="DOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblremarks" runat="server" Text='<%# Eval("DOB1") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                            

                                            <asp:TemplateField HeaderText="Mobile Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGContactNumber" runat="server" Text='<%# Eval("StudInfo_Mobile") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                                
                                             
                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGEmailId" runat="server" Text='<%# Eval("StudInfo_Email") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Photo">
                                                <ItemTemplate>
                                                    <a href='<%#Eval("StudInfo_Photo").ToString().Replace("~","..") %>' target="_blank" id="imglnk4" runat="server">
                                                        <asp:Image ID="Image5" runat="server" ImageUrl='<%#Eval("StudInfo_Photo") %>' Width="100px" Height="100px" /></a>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGQualification" runat="server" Text='<%# Eval("StudInfo_Address") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            

                                            <asp:TemplateField HeaderText="Gender">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGAddress" runat="server" Text='<%# Eval("StudInfo_Gender") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                                </asp:TemplateField>

                                            
                                            <asp:TemplateField HeaderText="Fathers Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGFathersName" runat="server" Text='<%# Eval("StudInfo_Father") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mothers Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblMothersname" runat="server" Text='<%# Eval("StudInfo_Mother") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Religion">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("StudInfo_Religion") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Hobbies">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblhobbies" runat="server" Text='<%# Eval("StudInfo_Hobbies") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sem">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSem" runat="server" Text='<%# Eval("StudInfo_Sem") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Branch">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrmrk" runat="server" Text='<%# Eval("StudInfo_Branch") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("StudInfo_MasterId") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

