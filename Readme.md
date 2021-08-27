<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128535924/12.1.8%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4349)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - How to turn off automatic auto filter row processing 
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4349/)**
<!-- run online end -->


<p>This example demonstrates how to turn off the automatic auto filter row processing and perform the filtering of all rows simultaneously by a button click. Perform the following steps to implement this scenario:</p>
<br />
<p>1) Remove the standard client-side ValueChanged and KeyDown event handlers for the filter row editors and create the custom handler. Use the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientEvent_ClearHandlerstopic"><u>ASPxClientEvent.ClearHandlers</u></a> and <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientEvent_AddHandlertopic"><u>ASPxClientEvent.AddHandler</u></a> methods for this purpose:</p>
<br />


```cs
    protected void gv_AutoFilterCellEditorInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs e) {
        ASPxTextBox editor = e.Editor as ASPxTextBox;
        if(editor != null) {
            editor.ClientSideEvents.Init = "function(s, e)  { s.ValueChanged.ClearHandlers(); s.KeyDown.ClearHandlers(); s.KeyDown.AddHandler( function(s, e) { if(e.htmlEvent.keyCode ==13) ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);}  );  }";
            editor.ClientInstanceName = "filterRow_" + e.Column.FieldName;
        }
    } 

```


<p> </p>


```vb
Protected Sub gv_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs)
	Dim editor As ASPxTextBox = TryCast(e.Editor, ASPxTextBox)
	If editor IsNot Nothing Then
		editor.ClientSideEvents.Init = "function(s, e)  {  s.ValueChanged.ClearHandlers(); s.KeyDown.ClearHandlers();   s.KeyDown.AddHandler( function(s, e) {  if(e.htmlEvent.keyCode ==13) ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); } ) ;  } "
		editor.ClientInstanceName = "filterRow_" & e.Column.FieldName
	End If
End Sub 

```


<p> </p>
<p>2) Now, when automatic filter is processing is turned off, it is necessary to perform filtering manually via the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_ApplyFiltertopic"><u>ASPxClientGridView.ApplyFilter</u></a> method:</p>


```js
   function ApplyFilter() {
            var filterCondition = "";
            var andOperator = "";
            for (var i = 0; i < gridViewR.GetColumnsCount(); i++)
                if (gridViewR.GetAutoFilterEditor(i) != null) {
                    if (filterCondition != "")
                        andOperator = "And "
                    var editor = eval("filterRow_" + gridViewR.GetColumn(i).fieldName);
                    if (editor)
                        if (editor.GetText() != "")
                            filterCondition = filterCondition + andOperator + "Contains( [" + gridViewR.GetColumn(i).fieldName + "]," + "'" + editor.GetText() + "')";
                }
            gridViewR.ApplyFilter(filterCondition);
        } 
```


<p><strong>Update:</strong><br />Starting with version v2013 vol 2.5, we have implemented the new 'on click' filter mode. In this mode, a filter is applied to the grid by clicking the <strong>Apply</strong> button, which is displayed in a command column. </p>
<p>To provide your application with this functionality, display the filter row in the grid by setting the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridViewSettings_ShowFilterRowtopic">ShowFilterRow</a> property to <strong>true</strong> and set the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridViewBehaviorSettings_FilterRowModetopic">FilterRowMode</a> property to <strong>OnClick</strong>.</p>

<br/>


