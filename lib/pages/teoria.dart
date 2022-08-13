import 'package:flutter/material.dart';


class PageTeoria extends StatelessWidget {
  const PageTeoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
    appBar: AppBar(
      title: Text("¡Comienza a aprender!"),
    ),
    body:ListView(
     children: <Widget>[
      Container(
        padding: EdgeInsets.all(20.0),
      child: Image.asset("assets/monitor.png"),
      ),

      Container(
        padding: EdgeInsets.all(20.0),
        child: Image.asset("assets/mouse.jpg"),

      ),

      Container(
        padding: EdgeInsets.all(20.0),
        child: Image.asset("assets/teclado.jpg"),
          //  child: Image.network("https://i.pinimg.com/originals/c8/e9/e2/c8e9e24e221d0c994b16decec7740662.png"),

      ),

      Container(
        padding: EdgeInsets.all(20.0),
        child: Image.asset("assets/CPU.png"),
          //  child: Image.network("https://i.pinimg.com/originals/c8/e9/e2/c8e9e24e221d0c994b16decec7740662.png"),

      ),

      Container(
        padding: EdgeInsets.all(20.0),
        child: Image.asset("assets/bocinas.png"),
          //  child: Image.network("https://i.pinimg.com/originals/c8/e9/e2/c8e9e24e221d0c994b16decec7740662.png"),

      )

     ],
      
    ),
    
    ),
  );
  }
}