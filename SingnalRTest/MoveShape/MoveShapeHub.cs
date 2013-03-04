using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SingnalRTest.MoveShape
{
    [HubName("moveShape")]
    public class MoveShapeHub : Hub
    {
        //even here starts with uppercase M, on the client side proxy becomes lowercase
        //hub.server.move1Shape
        public void MoveTheShape(int x, int y)
        {
            //call client side hub.client.shapeMoved
            Clients.Others.shapeMoved(x, y);
        }

    }
}