﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="SingnalRTest.MyTest.Client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script src="http://code.jquery.com/jquery-1.7.min.js" type="text/javascript"></script>
 
    <script src="../Scripts/jquery.signalR-1.0.0.js"></script>
  <script type="text/javascript">
      $(function () {
          var connection = $.connection('/echo');

          connection.received(function (data) {
              $('#messages').append('<li>' + data + '</li>');
          });

          connection.start().done(function () {
              $("#broadcast").click(function () {
                  connection.send($('#msg').val());
              });
          });

      });
  </script>

  <input type="text" id="msg" />
  <input type="button" id="broadcast" value="broadcast" />

  <ul id="messages">
  </ul>
</body>
</html>
