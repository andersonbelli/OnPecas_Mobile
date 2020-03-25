import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onpecas_mobile/api/partsApi.dart';
import 'package:onpecas_mobile/constrants.dart';
import 'package:onpecas_mobile/model/parts/parts.dart';

import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListHome(),
    );
  }
}

customTest() async {
  Dio dio = new Dio();
  final response = await dio.get(BASE_URL);

//  print("\n\n\nAQUI 111\n\n" +
//      jsonDecode('''[{"name":"Escapamento","price":21.0}]''').toString());
//  print("\n\n\nAQUI 222\n\n" +
//      json.decode('''[{"name":"Escapamento","price":21.0}]''').toString());

//  Map responseBody = response.data;
//  print(response.data.toString());

  dio.close();
}

class ListHome extends StatelessWidget {
  PartsApi partsApi = new PartsApi();

  @override
  Widget build(BuildContext context) {
    partsApi.fetchParts(BASE_URL);

//      GridView.builder(
//      gridDelegate:
//      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//      itemCount: parts.length,
//      itemBuilder: (context, index) {
//        return Text(parts[index].name);
//      },
//    );

    return FutureBuilder<List<Part>>(
      future: partsApi.fetchParts(BASE_URL),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PartsList(
                part: snapshot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class PartsList extends StatelessWidget {
  final List<Part> part;

  const PartsList({Key key, this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: part.length,
      itemBuilder: (context, index) {
        return Text(part[index].name.toString());
      },
    );
  }
}

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(clipBehavior: Clip.hardEdge, child: Text(""));
  }
}
