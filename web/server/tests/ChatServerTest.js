const { default: ChatServer } = require("../src/ChatServer");
const SocketIO = require('socket.io')();

describe('Class ChatServer Testing', ()=>{
    var CServer, CSocket;
    beforeEach(()=> {
        CSocket = new SocketIO();

        CServer = new ChatServer();
    });

    describe('Attributes', ()=>{


        test('Set Ip', ()=> expect(CServer.setSocket(CSocket).getIp()).toStrictEqual(CSocket));
    });

});