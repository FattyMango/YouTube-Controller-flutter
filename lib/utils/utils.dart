import 'dart:io';
import 'dart:convert';
import 'dart:async';


class Connection {
  String IP = '127.0.0.1';
  int PORT = 1234;
  var username = '5         malka';
  bool is_connected = false;
  late Socket socket;

  Future setup() async {
    print('called setup');
    print(is_connected);
    
    {
      socket = await Socket.connect(IP, PORT);
      print('connected');
      socket.add(utf8.encode(username));
    }
  }

   Future<void> send_command(String command)  async {
    // print("send");
    // socket = await Socket.connect(IP, PORT);
    // socket.add(utf8.encode(username));
    // socket.add(utf8.encode('2         ' + command));

    // String response = "";
    
    //  var x = socket.listen((data) {
    //   String _buffer = String.fromCharCodes(data);
    //   response = _buffer;
    //   if (!response.isEmpty)
    //   is_connected = true;
      
    // });

    
    // await Future.delayed(Duration(microseconds: 1));
    // await socket.close();
    // socket.destroy();
    // print(response);
    // return response;


    socket = await Socket.connect(IP, PORT);
   
    Socket.connect(IP, PORT).then((socket) {
    print('Connected to: '
      '${socket.remoteAddress.address}:${socket.remotePort}');
   
    //Establish the onData, and onDone callbacks
    socket.listen((data) {
      print(new String.fromCharCodes(data).trim());
    },
    onDone: () {
      print("Done");
      socket.destroy();
    });
  
    //Send the request
    socket.write(username);
    
  });
}
   }
  




  // Future<String>  rcev_response()  async {
  //   String response = "";
    
  //    var x = socket.listen((data) {
  //     String _buffer = String.fromCharCodes(data);
  //     response = _buffer;
  //     if (!response.isEmpty)
  //     is_connected = true;
      
  //   });

    
  //   await Future.delayed(Duration(microseconds: 1));
    
    
  //   return response;

  // }

  // void close() {
    
  //   socket.destroy();
  // }
// }

// main() async {
  
 

//   Connection conn = new Connection();
//   await conn.setup();
//   bool flag = true;
//   while (flag == true){
//     String command = stdin.readLineSync().toString();

//     if (command == 'q'){
//       conn.close();
//       print("closed");
//       flag = false;
//     }
//     else
//     conn.send_command(command);


//   }
//   return 0;
  
// }