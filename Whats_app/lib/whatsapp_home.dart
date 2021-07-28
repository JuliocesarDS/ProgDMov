import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/pages/call_screen.dart';
import 'package:whats_app/pages/camera_screen.dart';
import 'package:whats_app/pages/chat_screen.dart';
import 'package:whats_app/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget{
  final List<CameraDescription> cameras;
  WhatsAppHome({required this.cameras});
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> 
    with SingleTickerProviderStateMixin{
      
      late TabController _tabController;
      
      @override
      void initState(){
        super.initState();
        _tabController = new TabController(length: 4, vsync: this);
      }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CONVERSAS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CHAMADAS"),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message, color: Colors.white),
        onPressed: () => print("Open chat"),
      ),
    );
  }
}