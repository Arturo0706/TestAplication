import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Teclado extends StatelessWidget {
  const Teclado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido al teclado"),
        backgroundColor: Colors.orange
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(1),
          ),
          SizedBox(
            height: 15,
          ),
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0),
                    ],
                    image:
                        DecorationImage(image: AssetImage("assets/teclado.jpg"))),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0),
                    ],
                    image:
                        DecorationImage(image: AssetImage("assets/te.jpg"))),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0),
                    ],
                    image:
                        DecorationImage(image: AssetImage("assets/te2.jpg"))),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0),
                    ],
                    image:
                        DecorationImage(image: AssetImage("assets/te3.jpg"))),
              ),
            ],
            options: CarouselOptions(
              height: 190.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 4),
              scrollDirection: Axis.horizontal,
            ),
          ),
          CardTeclado()
        ],
      ),
      
    );
  }
}

class CardTeclado extends StatelessWidget {
  const CardTeclado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Card(
    
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    
    // Con esta propiedad agregamos margen a nuestro Card
    // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    margin: EdgeInsets.all(15),
    
    // Con esta propiedad agregamos elevación a nuestro card
    // La sombra que tiene el Card aumentará
    elevation: 10,

    // La propiedad child anida un widget en su interior
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[

        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Teclado', style: TextStyle(color: Colors.black, fontSize: 60), textAlign: TextAlign.center,),
          subtitle: Text(
              'Lo usamos para interactuar e introducir datos en el computador. Esta dividido en teclas: Alfanuméricas,numéricas, de función, de control, especiales, de desplazamiento. ', 
              style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.justify,),
          leading: Icon(Icons.computer_rounded),
        ),
        
        // Usamos una fila para ordenar los botones del card
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: <Widget>[
        //     FlatButton(onPressed: () => {}, child: Text('Aceptar')),
        //     FlatButton(onPressed: () => {}, child: Text('Cancelar'))
        //   ],
        // )
      ],
    ),
  );
  }
}