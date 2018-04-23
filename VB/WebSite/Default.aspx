<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
		<script type="text/javascript">
		function ApplyFilter() {
			var filterCondition = "";
			var andOperator = "";
			for (var i = 0; i < gridView.GetColumnsCount(); i++)
				if (gridView.GetAutoFilterEditor(i) != null) {
					if (filterCondition != "")
						andOperator = "And "
					var editor = eval("filterRow_" + gridView.GetColumn(i).fieldName);
					if (editor)
						if (editor.GetText() != "")
							filterCondition = filterCondition + andOperator + "Contains( [" + gridView.GetColumn(i).fieldName + "]," + "'" + editor.GetText() + "')";
				}
			gridView.ApplyFilter(filterCondition);
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	   <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
		KeyFieldName="EmployeeID" ClientInstanceName="gridView" Settings-ShowFilterRow="true"
		OnAutoFilterCellEditorInitialize="gv_AutoFilterCellEditorInitialize" Settings-ShowTitlePanel="true">
		<Columns>
			<dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0"
				Settings-AllowAutoFilterTextInputTimer="False">
				<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1" Settings-AllowAutoFilterTextInputTimer="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2" Settings-AllowAutoFilterTextInputTimer="False">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="TitleOfCourtesy" VisibleIndex="4">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="5">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="City" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="7">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="8">
			</dx:GridViewDataTextColumn>
		</Columns>
		<Templates>
			<TitlePanel>
				<dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Apply Filter">
					<ClientSideEvents Click="function(s, e) {
						 ApplyFilter();
					 }" />
				</dx:ASPxButton>
			</TitlePanel>
		</Templates>
		<Settings ShowFilterRow="True"></Settings>
		<Templates>
		</Templates>
	</dx:ASPxGridView>
	<asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [Address], [City], [Region], [Country], [ReportsTo] FROM [Employees]">
	</asp:AccessDataSource>
	</form>
</body>
</html>