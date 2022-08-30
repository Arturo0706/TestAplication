import 'package:flutter/material.dart';
import 'package:test_project/pages/PartesComputadora/bocinas.dart';
import 'package:test_project/pages/PartesComputadora/computadora.dart';
import 'package:test_project/pages/PartesComputadora/cpu.dart';
import 'package:test_project/pages/PartesComputadora/monitor.dart';
import 'package:test_project/pages/PartesComputadora/teclado.dart';
import 'package:test_project/pages/pantallaMenu.dart';

import 'PartesComputadora/mouse.dart';
import 'inicio_examen.dart';

class Opciones extends StatelessWidget {
  const Opciones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('¡Comienza a aprender!'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ListComputadora(),
          ListCpu(), 
          ListMouse(),
          ListBocinas(),
          ListTeclado(),
          ListMonitor(), 
          ListResume()
          ],
      )),
    );
  }
}

class ListBocinas extends StatelessWidget {
  const ListBocinas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Bocinas()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("Bocinas", style: TextStyle(fontSize: 30, color: Colors.white)), 
            
          ],
        ),
      ),
    );
  }
}

class ListComputadora extends StatelessWidget {
  const ListComputadora({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Computadora()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("Computadora", style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}



class ListTeclado extends StatelessWidget {
  const ListTeclado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Teclado()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("Teclado", style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}



class ListMouse extends StatelessWidget {
  const ListMouse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Mouse()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("Mouse", style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}


class ListCpu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Cpu()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("CPU", style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}


class ListMonitor extends StatelessWidget {
  const ListMonitor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Monitor()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.computer_rounded),
            SizedBox(width: 50),
            Text("Monitor", style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
    
  }
}

class ListResume extends StatelessWidget {
  const ListResume({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => PantallaMenu()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
           Icon(Icons.fact_check),
            SizedBox(width: 50),
            Text("Conoce las partes básicas de la computadora" , style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        ),
      ),
    );
  }
}



