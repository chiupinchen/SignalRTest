<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveShape.aspx.cs" Inherits="SingnalRTest.MoveShape.MoveShape" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
       #shape
       {
           width:100px; height:100px; background-color:#f00; cursor:move;

       }

   </style>
</head>
<body>
    <div id="shape"></div>
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/jquery-ui-1.10.1.min.js"></script>
    <script src="../Scripts/jquery.signalR-1.0.0.min.js"></script>
    <script src="/signalr/hubs"></script>
    <script>
        $(function(){
        
        
            var hub = $.connection.moveShape,
                $shape = $("#shape");
        
            hub.client.shapeMoved = function(x, y) {
            
                $shape.css({left:x, top: y});
            };

            $.connection.hub.start().done(function(){
                $shape.draggable({
                    drag: function () {
                        
                        hub.server.moveTheShape(this.offsetLeft, this.offsetTop || 0);
                    }               
                });
            });

        });



    </script>

</body>
</html>
