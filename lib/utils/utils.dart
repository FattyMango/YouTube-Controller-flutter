import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:network_info_plus/network_info_plus.dart';

class Connection {
  final String deviceName;
  final String ADDRESS;
  final int PORT;
  late Socket _socket;

  Connection({
    required this.deviceName,
    this.ADDRESS = '192.168.1.14',
    this.PORT = 1234,
  });

  Future<bool> setup() async {

    
  
    this._socket = await Socket.connect(this.ADDRESS , this.PORT);
    
    this._socket.add(utf8.encode(header_serializer(this.deviceName)));

    return true;
  }

  Future<dynamic> send_message({required String command,String option = ''}) async {
    if(option!='')
      this._socket.add(utf8.encode(header_serializer(command+option)));
    else
      this._socket.add(utf8.encode(header_serializer(command)));
    this._socket.close();
    String results = await utf8.decoder.bind(this._socket).join();
    return json.decode(results);
  }
}

String header_serializer(String deviceName) {
  String payload;
  int len = deviceName.length;

  payload = len.toString();
  for (var i = 0; i < 10 - len.toString().length; i++) payload += ' ';

  payload += deviceName;

  return payload;
}

Future<dynamic> send_command(
    {required String deviceName,
    required String command,
    String? option,
    String? ADDRESS,
    int? PORT}) async {
      await scanNetwork();
  // Connection c = Connection(deviceName: deviceName);
  // await c.setup();
  // var response;
  // if (int.parse(command) >= 8)  response = await c.send_message(command:command,option:option.toString());
  // else response = await c.send_message(command:command);
  // return response;
}

Future<void> scanNetwork() async {
  await (NetworkInfo().getWifiIP()).then(
    (ip) async {
      final String subnet = ip!.substring(0, ip.lastIndexOf('.'));
      const port = 22;
      for (var i = 0; i < 256; i++) {
        String ip = '$subnet.$i';
        await Socket.connect(ip, port, timeout: Duration(milliseconds: 50))
          .then((socket) async {
            await InternetAddress(socket.address.address)
              .reverse()
              .then((value) {
                print(value.host);
                print(socket.address.address);
              }).catchError((error) {
                print(socket.address.address);
                print('Error: $error');
              });
            socket.destroy();
          }).catchError((error) => null);
      }
    },
  );
  print('Done');
}