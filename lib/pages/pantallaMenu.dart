import 'package:flutter/material.dart';
import 'package:test_project/pages/inicio_examen.dart';
import '../clases/partesComputadora.dart';

class PantallaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resumen de lección..."),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Colors.deepOrange,
        body: Container(
          child: GridView.builder(
              itemCount: Menu.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        // print("Click en: " + Menu[index].nombre);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => PageTest()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/" + Menu[index].foto,
                            width: 150,
                          ),
                          Text(Menu[index].nombre)
                        ],
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
