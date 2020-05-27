
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class Socket extends StatefulWidget {
  @override
  _SocketState createState() => _SocketState();
}

class _SocketState extends State<Socket> {
  TextEditingController _textEditingController;
  WebSocketChannel _channel;
  String _status;


  @override
  void initState(){
    super.initState();
    _textEditingController=TextEditingController();
    _connectSocketChannel();
 
  }
 
  @override
  void dispose() {
  
    super.dispose();
    _channel.sink.close();
  }
  _connectSocketChannel(){
    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }
  void senMessage(){
    _channel.sink.add(_textEditingController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Let's Chat"),
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller:_textEditingController ,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),

                ),
                filled: true,
                fillColor: Colors.white60,
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Message',
              ),
            ),
            SizedBox(height: 20,),
            OutlineButton(onPressed: (){
              if(_textEditingController.text.isEmpty){return;}
             senMessage();

            },
            child: Text('Send Message'),
            ),
            SizedBox(height: 20,),
           
            StreamBuilder(
              stream: _channel.stream,
              builder: (context,snapshot){
              return Padding(padding: EdgeInsets.symmetric(vertical: 24.0),
              child:Text(snapshot.hasData ? '${snapshot.data}':''));
            }
            )
          ],
        ),
      ),
    );
  }

 
}