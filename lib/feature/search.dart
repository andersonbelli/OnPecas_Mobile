import 'package:flutter/material.dart';
import 'package:onpecas_mobile/constrants.dart';

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
