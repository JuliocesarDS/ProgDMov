import 'package:flutter/material.dart';
import 'home_page.dart';

/*Função Main
  Cria um objeto da classe MyApp
*/
void main() => runApp(new MyApp());

/*
  Classe MyApp
  Herda a classe StatelessWidget("https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html")
*/
class MyApp extends StatelessWidget{
/*
  sobrescrevendo o método build
  Recebe o contexto no qual a função biuld está inserido
  Retorna um novo objeto da classe MaterialApp ("https://api.flutter.dev/flutter/material/MaterialApp-class.html")
*/
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Calculadore",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new HomePage(),
    );
  }
}

