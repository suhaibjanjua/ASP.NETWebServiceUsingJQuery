<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ASP.NETWebServiceUsingJQuery.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[id*=Button1]").click(function () {
                var message = $("[id*=TextBox1]").val();

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/getMessage",
                    data: "{ name: '" + message + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        alert(r.d);
                    },
                    error: function (r) {
                        alert(r.responseText);
                    },
                    failure: function (r) {
                        alert(r.responseText);
                    }
                });
                return false;
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="GetMessage" Style="height: 26px" />
            <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
            </asp:ScriptManager>
        </div>
    </form>

</body>
</html>
