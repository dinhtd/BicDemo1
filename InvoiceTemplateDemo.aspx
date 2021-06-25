<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvoiceTemplateDemo.aspx.cs" Inherits="InvoiceTemplateDemo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Infragistics4.WebUI.UltraWebGrid.v10.3, Version=10.3.20103.2217, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>


<script type="text/javascript" id="igClientScript">

 function InitializeRow(gridName, cellId) {
     

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        TBODY.igg_Item > TR > TD {
            white-space:nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Lấy dữ liệu từ file XML" 
            onclick="Button1_Click" />

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <h1>XML Extract DATA Result</h1>
        <asp:Datagrid runat="server" ID = "dgrInvoice" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <ItemStyle BackColor="White" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" 
                Mode="NumericPages" />
            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:Datagrid>
       
    </div>
    <p>
        &nbsp;</p>

        <h1>XML TEMPLATE DATA</h1>

        



    <igtbl:UltraWebGrid ID="uwgClaimDetail"  runat="server"
        Width="100%" onaddrowbatch="uwgClaimDetail_AddRowBatch" 
        ondeleterowbatch="uwgClaimDetail_DeleteRowBatch" 
        oninitializedatasource="uwgClaimDetail_InitializeDataSource" 
        oninitializelayout="uwgClaimDetail_InitializeLayout" 
        onupdaterowbatch="uwgClaimDetail_UpdateRowBatch" 
        StyleSetName="Office2007Blue">
                <Bands>
            <igtbl:UltraGridBand AllowAdd="Yes" AllowDelete="Yes" AllowUpdate="Yes" 
                BaseTableName="list.invoice_template">
                                                        <Columns>
                                            <igtbl:UltraGridColumn AllowUpdate="No" BaseColumnName="id" 
                                                DataType="System.Decimal" Hidden="True" Key="id">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="id">
                                                </Header>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="provider" Key="provider" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Nhà cung cấp"  >
                                                    <RowLayoutColumnInfo OriginX="1" />
                                                </Header>
                                                <CellStyle Wrap="true"></CellStyle>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="1" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="invoice_type" Key="invoice_type" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Mẫu hóa đơn">
                                                    <RowLayoutColumnInfo OriginX="2" />
                                                </Header>
                                                <CellStyle Wrap="true"></CellStyle>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="2" />
                                                </Footer>
                                                
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="invoice_serial" Key="invoice_serial" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Ký hiệu HĐ">
                                                    <RowLayoutColumnInfo OriginX="3" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="3" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="invoice_num" Key="invoice_num" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Số HĐ">
                                                    <RowLayoutColumnInfo OriginX="4" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="4" />
                                                </Footer>
                                                <CellStyle Wrap="true"></CellStyle>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="issued_date" Key="issued_date" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Ngày phát hành">
                                                    <RowLayoutColumnInfo OriginX="5" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="5" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="seller_name" Key="seller_name" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Công ty phát hành">
                                                    <RowLayoutColumnInfo OriginX="6" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="6" />
                                                </Footer>
                                                <CellStyle Wrap="true"></CellStyle>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="seller_tax_code" Key="seller_tax_code" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Mã số thuế">
                                                    <RowLayoutColumnInfo OriginX="7" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="7" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="seller_address" Key="seller_tax_code" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Địa chỉ">
                                                    <RowLayoutColumnInfo OriginX="8" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="8" />
                                                </Footer>
                                                <CellStyle Wrap="true"></CellStyle>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="item_name" Key="item_name" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Hàng hóa/Dịch vụ">
                                                    <RowLayoutColumnInfo OriginX="9" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="9" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="amount_money" Key="amount_money" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Số tiền trước thuế">
                                                    <RowLayoutColumnInfo OriginX="10" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="10" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="vat_percentage" Key="vat_percentage" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Thuế suất">
                                                    <RowLayoutColumnInfo OriginX="11" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="11" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="vat_mount" Key="vat_mount" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Tiền thuế">
                                                    <RowLayoutColumnInfo OriginX="12" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="12" />
                                                </Footer>
                                                <CellStyle Wrap="true"></CellStyle>
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn AllowNull="False" AllowUpdate="Yes" 
                                                BaseColumnName="total_money" Key="total_money" Width="10%">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Header Caption="Tổng tiền">
                                                    <RowLayoutColumnInfo OriginX="13" />
                                                </Header>
                                                <Footer>
                                                    <RowLayoutColumnInfo OriginX="13" />
                                                </Footer>
                                            </igtbl:UltraGridColumn>
                                        </Columns>
                <AddNewRow View="NotSet" Visible="NotSet">
                </AddNewRow>
            </igtbl:UltraGridBand>
        </Bands>
                                        <DisplayLayout Version="2.00" SelectTypeRowDefault="Extended" Name="ctl00xuwgClaimDetail"
                                    AllowAddNewDefault="Yes" AllowDeleteDefault="Yes" AllowUpdateDefault="Yes" AllowColSizingDefault="Free"
                                    ColWidthDefault="" RowHeightDefault="20px" TableLayout="Fixed" ViewType="OutlookGroupBy"
                                    CellClickActionDefault="Edit" HeaderClickActionDefault="SortSingle" BorderCollapseDefault="Separate"
                                    AutoGenerateColumns="False"  NoDataMessage="Không có dữ liệu" GroupByColumnsHiddenDefault="Yes"
                                    AllowRowNumberingDefault="Continuous" EnableClientSideRenumbering="True" EnableInternalRowsManagement="True"
                                    ColFootersVisibleDefault="Yes" AllowSortingDefault="OnClient" LoadOnDemand="Manual" 
                                    
                                    
                                    FilterOptionsDefault-ContainsString="Bao gồm chuỗi" FilterOptionsDefault-DoesNotContainString="Khong bao gồm chuỗi" FilterOptionsDefault-DoesNotEndWithString="Không kết thúc với chuỗi" FilterOptionsDefault-EndsWithString="Kết thúc với chuỗi" FilterOptionsDefault-EqualsString="Bằng" FilterOptionsDefault-GreaterThanOrEqualsString="Lớn hơn hoặc bằng" FilterOptionsDefault-GreaterThanString="Lớn hơn" FilterOptionsDefault-LessThanOrEqualsString="Nhỏ hơn hoặc bằng" FilterOptionsDefault-LessThanString="Nhỏ hơn" FilterOptionsDefault-LikeString="Gần đúng chuỗi" FilterOptionsDefault-NotEqualsString="Không bằng" FilterOptionsDefault-NotLikeString="Không gần đúng chuỗi" FilterOptionsDefault-StartsWithString="Bắt đầu với chuỗi" GroupByBox-Hidden="False" GroupByBox-Prompt="Kéo tiêu đề cột vào đây để tạo nhóm" FilterOptionsDefault-DoesNotStartWithString="Không bắt đầu vưới chuỗi" UseFixedHeaders="False">
                                    

									<FrameStyle Cursor="Default" BackColor="Window" BorderColor="InactiveCaption" BorderWidth="1px"
                                        BorderStyle="Solid" Font-Names="Microsoft Sans Serif" Font-Size="8.25pt" 
                                        Width="100%" >
                                    </FrameStyle>



                                    <Pager PageSize="25" AllowPaging="true"></Pager>
                                    <RowAlternateStyleDefault BackColor="#F7F7F7">
                                    </RowAlternateStyleDefault>
                                    
                                    <EditCellStyleDefault BackColor="#FFFFC0" BorderStyle="None" BorderWidth="0px" 
                                        Font-Names="Verdana" Font-Size="8pt" HorizontalAlign="Right" 
                                        VerticalAlign="Middle">
                                        <Padding Left="2px" Right="2px" />
                                    </EditCellStyleDefault>
                                    <FooterStyleDefault BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px" 
                                        HorizontalAlign="Justify" VerticalAlign="Middle" Wrap="True">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                            WidthTop="1px" />
                                    </FooterStyleDefault>
                                    <HeaderStyleDefault BackColor="LightGray" HorizontalAlign="Left">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                            WidthTop="1px" />
                                    </HeaderStyleDefault>
                                    <RowSelectorStyleDefault BackColor="WhiteSmoke" BorderStyle="None">
                                    </RowSelectorStyleDefault>
                                    <RowStyleDefault BackColor="Window" BorderColor="Silver" BorderStyle="Solid" 
                                        BorderWidth="1px" Font-Names="Microsoft Sans Serif" Font-Size="8.25pt">
                                        <Padding Left="2px" />
                                        <BorderDetails ColorLeft="Window" ColorTop="Window" />
                                    </RowStyleDefault>
                                    <SelectedRowStyleDefault BackColor="#738A9C" ForeColor="#F7F7F7">
                                    </SelectedRowStyleDefault>



                                    <AddNewBox ButtonConnectorColor="0, 0, 192" Hidden="False" Prompt="">
                                        <ButtonStyle BackColor="WhiteSmoke" Cursor="Hand">
                                        </ButtonStyle>
                                        <BoxStyle BackColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px">
                                            <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                                                WidthTop="1px" />
                                        </BoxStyle>
                                    </AddNewBox>
                                    <ActivationObject BorderColor="" BorderWidth="">
                                    </ActivationObject>
                                    <RowExpAreaStyleDefault BackColor="White">
                                    </RowExpAreaStyleDefault>
                                </DisplayLayout>

    </igtbl:UltraWebGrid>

    <asp:Button ID="btnSave" runat="server" Text="Lưu lại" 
        onclick="btnSave_Click" />
        
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>


    </form>
    
        



</body>

</html>
