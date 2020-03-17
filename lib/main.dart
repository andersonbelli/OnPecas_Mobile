import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:onpecas_mobile/ui/cart.dart';
import 'package:onpecas_mobile/ui/home.dart';

import 'assets/colors.dart';
import 'ui/menu.dart';
import 'ui/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleHiddenDrawer(
        slidePercent: 50.0,
        menu: Menu(),
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;

          switch (position) {
            case 0:
              screenCurrent = Home();
              break;
            case 1:
              screenCurrent = Cart();
              break;
            case 2:
              screenCurrent = Product();
              break;
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: blueOnpecas,
              title: Text(
                "Onpecas",
                style: TextStyle(fontFamily: 'Aquantico'),
              ),
              elevation: 0.0,
              centerTitle: true,
              leading: Container(
                margin: const EdgeInsets.only(left: 30),
                padding: const EdgeInsets.all(0),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        controller.toggle();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    );
                  },
                ),
              ),
              actions: <Widget>[
                IconButton(
                  padding: const EdgeInsets.only(right: 30),
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                )
              ],
            ),
            body: screenCurrent,
          );
        },
      ),
    );
  }
}
