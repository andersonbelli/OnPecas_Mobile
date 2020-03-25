import 'dart:convert';
import 'package:dio/dio.dart';

class Parts {
  final List<Part> parts;

  Parts({this.parts});

  factory Parts.fromJson(Response<dynamic> jsonResponse) {
    List<Part> parts = new List<Part>();

    parts =
        (json.decode(jsonResponse.data)).map((i) => Part.fromJson(i)).toList();

    return new Parts(
      parts: parts,
    );
  }

  factory Parts.fromJson1(List<dynamic> jsonResponse) {
    List<Part> parts = new List<Part>();

    parts = jsonResponse
        .map<Part>((jsonResponse) => Part.fromJson(jsonResponse))
        .cast<Part>()
        .toList();

    return new Parts(
      parts: parts,
    );
  }
}

class Part {
  final String name;
  final double price;

  Part({this.name, this.price});

  factory Part.fromJson(Map<String, dynamic> json) {
    return new Part(
      name: json["name"],
      price: json["price"],
    );
  }
}
