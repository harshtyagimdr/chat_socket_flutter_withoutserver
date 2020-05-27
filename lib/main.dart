
import 'package:chat_socket_withoutserver/socket.dart';
import 'package:flutter/material.dart';


void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatting App',
     home:Socket(),
    );
  }
}

