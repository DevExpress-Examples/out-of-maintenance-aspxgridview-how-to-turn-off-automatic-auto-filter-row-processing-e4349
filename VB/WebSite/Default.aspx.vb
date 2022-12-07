Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub gv_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewEditorEventArgs)
		Dim editor As ASPxTextBox = TryCast(e.Editor, ASPxTextBox)
		If editor IsNot Nothing Then
			editor.ClientSideEvents.Init = "function(s, e)  {  s.ValueChanged.ClearHandlers(); s.KeyDown.ClearHandlers();   s.KeyDown.AddHandler( function(s, e) {  if(e.htmlEvent.keyCode ==13) ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); } ) ;  } "
			editor.ClientInstanceName = "filterRow_" & e.Column.FieldName
		End If
	End Sub
End Class
