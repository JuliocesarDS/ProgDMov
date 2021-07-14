import 'package:flutter/material.dart';

/*
  Classe HomePage
  Herda a classe StatefulWidget ("https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html")
*/
class HomePage extends StatefulWidget{
  @override
  //Cria um objeto state, chamando um novo objeto que herda a classe StatefulWidget
  State createState() => new HomePageState();
}

/*
  Classe HomePageState
  Criação da classe HomePageState que herda um estado associado com classe HomePage
*/
class HomePageState extends State<HomePage>{
  var num1 = 0, num2 = 0;
  var res = 0;

  //Inicia e atualiza os valores que serão somados
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  //Função da adição
  void doAddition(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1 + num2;
    });
  }

  //Função da subtração
  void doSub(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1 - num2;
    });
  }

  //Função da multiplicação
  void doMul(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      res = num1 * num2;
    });
  }

  //Função usado para exibir um Dialogo, notificando que foi feita uma divisão por 0
  void _showDialog() {
    //Função do flutter. Cria um widget que exibe o dialogo ("https://api.flutter.dev/flutter/material/showDialog.html")
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Retorna um objeto do tipo Dialogo, especificando os conteúdos que o Dialogo conterá
        return AlertDialog(
          title: new Text("Divisão por 0"),
          content: new Text("Não aceitamos divisão por 0"),
          actions: <Widget>[
            //Cria um botão, para o usuário fechar o dialogo criado.
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Função da divisão
  void doDiv(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      //Tratamento de execeção do tipo Divisão por 0
      try{
        res = num1 ~/ num2;
      } on IntegerDivisionByZeroException{
        _showDialog();
      }

    });
  }

  /*
  sobrescrevendo o método build
  Recebe o contexto no qual a função biuld está inserido
  Retorna um novo objeto da classe Scaffold, onde é implementado toda a estrutura básica de layout visual do material design. 
  ("https://api.flutter.dev/flutter/material/Scaffold-class.html")
*/
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculadora"),
      ),
      //Cria um novo container para o corpo do layout
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Print do resultado
            new Text(
             "Resultado: $res",
             style: new TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold ,
                 color: Colors.red)
           ),
           //Recebe o primeiro número, e atualiza o controlador t1
           new TextField(
             keyboardType: TextInputType.number,
             decoration: new InputDecoration(hintText: "Insira o primeiro número"),
             controller: t1,
           ),
           //Recebe o segundo número, e atualiza o controlador t2
           new TextField(
             keyboardType: TextInputType.number,
             decoration: new InputDecoration(hintText: "Insira o segundo número"),
             controller: t2,
           ),
           new Padding(
             padding: const EdgeInsets.only(top:20.0),
           ),
           //Cria uma nova linha que contém as operações de soma e subtração
           new Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               new MaterialButton(
                 child: new Text("+"),
                 color: Colors.greenAccent,
                 onPressed: doAddition,
               ),
               new MaterialButton(
                 child: new Text("-"),
                 color: Colors.greenAccent,
                 onPressed: doSub,
               ),
             ],
           ),
           //Cria uma nova linha que contém as operações de multiplicação e divisão
           new Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               new MaterialButton(
                 child: new Text("*"),
                 color: Colors.greenAccent,
                 onPressed: doMul,
               ),
               new MaterialButton(
                 child: new Text("/"),
                 color: Colors.greenAccent,
                 onPressed: doDiv,
               ),
             ],
           )
         ],
       ),
      ),
    );
  }

}