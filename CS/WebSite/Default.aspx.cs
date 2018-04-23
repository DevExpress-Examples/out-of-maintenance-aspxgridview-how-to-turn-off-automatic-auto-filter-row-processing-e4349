using System;
using System.Collections.Generic;
using System.Linq;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page
{
    protected void gv_AutoFilterCellEditorInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs e) {
        ASPxTextBox editor = e.Editor as ASPxTextBox;
        if(editor != null) {
            editor.ClientSideEvents.Init = "function(s, e)  {  s.ValueChanged.ClearHandlers(); s.KeyDown.ClearHandlers();   s.KeyDown.AddHandler( function(s, e) {  if(e.htmlEvent.keyCode ==13) ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); } ) ;  } ";
            editor.ClientInstanceName = "filterRow_" + e.Column.FieldName;
        }
    }
}
