<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MicrosoftTranslatorAJAX.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.7.2.js"></script>
    <script>
        $(window).load(function () {
            $('#btnAjaxTranslate').click(function (evt) {
                var inputText = $('#txtAjaxInput').val();
                var authToken = $('#txtAuthToken').val();
                var data = {
                    appId: 'Bearer ' + authToken,
                    from: 'en',
                    to: 'de',
                    contentType: 'text/plain',
                    text: inputText
                };

                $.ajax({
                    url: "http://api.microsofttranslator.com/V2/Ajax.svc/Translate",
                    dataType: 'jsonp',
                    data: data,
                    jsonp: 'oncomplete'
                })
                .done(function (jqXHR, textStatus, errorThrown) {
                    console.log('done', this, jqXHR, textStatus, errorThrown);
                    $('#txtAjaxOutput').text(jqXHR);
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log('fail', this, jqXHR, textStatus, errorThrown);
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Microsoft Translator AJAX Example</h1>
        <h2>Input</h2>
        <div>
            <asp:TextBox ID="txtAuthToken" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtAuthExpires" runat="server"></asp:TextBox>
        </div>
        <div>
            <input type="text" id="txtAjaxInput" value="hello world" />
            <input type="button" id="btnAjaxTranslate" value="Ajax Translation!" />
        </div>
        <h2>Output</h2>
        <div>
            <span id="txtAjaxOutput">Nothing yet...</span>
        </div>
    </form>
</body>
</html>
