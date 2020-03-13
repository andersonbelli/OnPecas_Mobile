import 'package:flutter/material.dart';

import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

import '../assets/colors.dart';

import 'home.dart';
import 'product.dart';
import 'cart.dart';

class Menu extends StatefulWidget {
  const Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<Menu> {
  List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Onpecas",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.lightGreen,
        ),
        Home()));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Carrinho",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
        ),
        Cart()));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Promoções",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
        ),
        Product()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        backgroundColorMenu: blueOnpecas,
        backgroundColorAppBar: blueOnpecas,
        elevationAppBar: 0.0,
        screens: itens);
  }
}
