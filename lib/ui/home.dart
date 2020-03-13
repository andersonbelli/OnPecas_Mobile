import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../assets/colors.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Onpecas",
//          style: TextStyle(fontFamily: 'Aquantico'),
//        ),
//        elevation: 0.0,
//        centerTitle: true,
////          leading: Container(
////            margin: const EdgeInsets.only(left: 30),
////            padding: const EdgeInsets.all(0),
////            child: Builder(
////              builder: (BuildContext context) {
////                return IconButton(
////                  icon: Icon(Icons.menu),
////                  onPressed: () {},
////                  splashColor: Colors.transparent,
////                  highlightColor: Colors.transparent,
////                );
////              },
////            ),
////          ),
//        actions: <Widget>[
//          IconButton(
//            padding: const EdgeInsets.only(right: 30),
//            icon: Icon(Icons.shopping_cart),
//            onPressed: () {},
//            splashColor: Colors.transparent,
//            highlightColor: Colors.transparent,
//          )
//        ],
//      ),
      body: new Column(
        children: <Widget>[
          SearchBox(),
          ListHome()
          //new Expanded(child: ListHome()),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      height: 45,
      color: blueOnpecas,
      child: TextField(
        cursorColor: blueOnpecas,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(1),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: IconButton(
              iconSize: 20,
              icon: Icon(Icons.search),
              color: blueOnpecas,
              onPressed: () {},
            ),
            border: InputBorder.none),
      ),
    );
  }
}

class ListHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: blueOnpecas,
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Text("onpecas :D"),
        ),
      ),
    );
  }
}
