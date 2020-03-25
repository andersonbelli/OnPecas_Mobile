import 'package:onpecas_mobile/model/parts/parts.dart';

import 'package:dio/dio.dart';

class PartsApi {
  Dio dio = new Dio();

  Future<List<Part>> fetchParts(String url) async {
    final response = await dio.get(url);

    return parseParts(response.data);
  }

  List<Part> parseParts(List<dynamic> jsonResponse) {
    final _data = Parts.fromJson1(jsonResponse);

    dio.close();
    return _data.parts;
  }
}
