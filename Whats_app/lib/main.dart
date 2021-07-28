import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whats_app/whatsapp_home.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: new WhatsAppHome(cameras:cameras),
    );
  }
}