import 'package:flutter/material.dart';
import 'package:test_project/pages/opciones.dart';
import 'package:test_project/pages/pantallaMenu.dart';

class PageInformacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 5,top: 50, bottom: 50),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                    )
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Aprende computación con Miss Lili", style: TextStyle(color:Colors.amberAccent, fontSize: 20, fontStyle: FontStyle.italic, letterSpacing: 5),),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/teacher.png",
                    width: MediaQuery.of(context).size.width / 2,
                    height: 400,
                    
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                RaisedButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(13.0),
                  color: Colors.red,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Opciones()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
