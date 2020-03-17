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
    return new Column(
      children: <Widget>[
        SearchBox(),
        ListHome()
        //new Expanded(child: ListHome()),
      ],
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
