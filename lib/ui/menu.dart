import 'package:flutter/material.dart';

import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:onpecas_mobile/constrants.dart';
import 'package:onpecas_mobile/model/menu_item.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuItem> itemsMenu = [
    MenuItem(name: "Home", color: Colors.white.withOpacity(0.8)),
    MenuItem(name: "Cart", color: Colors.green.withOpacity(0.8)),
    MenuItem(name: "Product", color: Colors.orange.withOpacity(0.8))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: blueOnpecas,
      //padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment(-0.97, 0.0),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 220, bottom: 100),
            itemBuilder: (context, index) {
              if (index >= itemsMenu.length) {
                return null;
              }
              return CustomMenuItem(
                  name: itemsMenu[index].name,
                  color: itemsMenu[index].color,
                  index: index,
                  notifyParent: refresh);
            },
          )),
    );
  }

  refresh() {
    setState(() {});
  }
}

class CustomMenuItem extends StatelessWidget {
  final String name;
  final Color color;
  final int index;
  final Function() notifyParent;

  CustomMenuItem(
      {Key key, this.name, this.color, this.index, this.notifyParent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: const EdgeInsets.all(0),
          splashColor: Colors.white12,
          highlightColor: Colors.transparent,
          child: Row(
            children: <Widget>[
              Container(
                width: 4,
                height: 40,
                color: SimpleHiddenDrawerProvider.of(context)
                            .getPositionSelected() ==
                        this.index
                    ? this.color
                    : Colors.transparent,
                margin: const EdgeInsets.only(right: 10),
              ),
              Text(this.name,
                  style: TextStyle(
                      color: SimpleHiddenDrawerProvider.of(context)
                                  .getPositionSelected() ==
                              this.index
                          ? Colors.white.withOpacity(1)
                          : Colors.white.withOpacity(0.8),
                      fontSize: 28.0)),
            ],
          ),
          onPressed: () {
            SimpleHiddenDrawerProvider.of(context)
                .setSelectedMenuPosition(this.index);
            notifyParent();
          },
        ),
      ],
    );
  }
}
