import 'dart:async';
import 'dart:convert';
import 'dart:io';




class Connection {
  final String deviceName;
  final String ADDRESS;
  final int PORT;
  late Socket _socket;

  Connection({
    required this.deviceName,
    this.ADDRESS = '',
    this.PORT = 1234,
  });

  Future<bool> setup() async {
    print(this.ADDRESS);
    if (this.ADDRESS!='')
    this._socket = await Socket.connect(this.ADDRESS , this.PORT);
    else
    this._socket = await Socket.connect("192.168.1.121" , this.PORT);
    
    this._socket.add(utf8.encode(header_serializer(this.deviceName)));

    return true;
  }

  Future<String> send_message({required String command,String option = ''}) async {
    if(option!='')
      this._socket.add(utf8.encode(header_serializer(command+option)));
    else
      this._socket.add(utf8.encode(header_serializer(command)));
    this._socket.close();
    String results = await utf8.decoder.bind(this._socket).join();
    return results;
  }
}

String header_serializer(String deviceName) {
  String payload;
  int len = deviceName.length;

  payload = len.toString();
  for (var i = 0; i < 10 - len.toString().length; i++) payload += ' ';

  payload += deviceName;
  // print(payload);
  return payload;
}

Future<dynamic> send_command(
    {required String deviceName,
    required String command,
    String? option,
    String? ADDRESS,
    int? PORT}) async {
    print('i got' +ADDRESS!);
  Connection c = Connection(deviceName: deviceName,ADDRESS: ADDRESS);
  await c.setup();
  var response;
  if (int.parse(command) >= 50)  response = await c.send_message(command:command,option:option.toString());
  else response = await c.send_message(command:command);
  print('here'+response);

  return json.decode(response, reviver: null);
}
