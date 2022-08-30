import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:test_project/pages/informacion.dart';
import 'package:test_project/pages/inicio_examen.dart';
import 'package:test_project/pages/pantallaMenu.dart';
import 'package:test_project/pages/teoria.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final PageInformacion _listInformacion = new PageInformacion();
  final PageTeoria _listTeoria = new PageTeoria();
  final PageTest _listTest = new PageTest();
  final PantallaMenu _listPantalla = new PantallaMenu();

  Widget _showPage = new PageInformacion(); //Primer vista

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listInformacion;
        break;
      // case 1:
      //   return _listPantalla;
      //   break;
      // case 2:
      //   return _listTest;
      //   break;
      
      default:
        return new Container(
          child: new Center(
              child: new Text(
            "Página no encontrada",
            style: new TextStyle(fontSize: 30),
          )),
        );
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: pageIndex,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.emoji_people, size: 30),
                // Icon(Icons.auto_stories, size: 30),
                // Icon(Icons.document_scanner, size: 30),
               
                // Icon(Icons.call_split, size: 30),
                // Icon(Icons.perm_identity, size: 30),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (int tappedIndex) {
                setState(() {
                  _showPage = _pageChooser(tappedIndex);
                });
              },
              letIndexChange: (index) => true,
            ),
            body: Container(
              color: Colors.blueAccent,
              child: Center(
                child: _showPage,
              ),
            )));
  }
}
