import 'package:dio/dio.dart';
import 'package:onpecas_mobile/model/parts/parts.dart';

class PartsApi {
  Dio dio = new Dio();

  Future<List<Part>> fetchParts(String url) async {
    final response = await dio.get(url);

    var responseData;

    if (response.statusCode != 200) {
      responseData = response.data;
      print("AQUI ->>" + responseData.runtimeType.toString());
    } else {
      print("\n\nCODE AQUI " + response.statusCode.toString());

      //List<dynamic> customParts = new List<dynamic>();

      final List<dynamic> customParts = new List<dynamic>();

      final Map<String, dynamic> customMap1 = {
        "name": "Motor",
        "brand": "Chevrolet",
        "model": "RX-41T",
        "url":
            "https://pngimage.net/wp-content/uploads/2018/06/motor-carro-png-1.png",
        "price": 3400.0
      };

      final Map<String, dynamic> customMap2 = {
        "name": "Exhaust",
        "brand": "Peugeot",
        "model": "208 default",
        "url":
            "https://pngimage.net/wp-content/uploads/2018/05/escapamento-png-5.png",
        "price": 285.0
      };

      final Map<String, dynamic> customMap3 = {
        "name": "Wheels",
        "brand": "Fiat",
        "model": "500 Alloy",
        "url":
            "https://cdn.shopify.com/s/files/1/1086/2168/products/sanremo17-mat-black_b2dc4b9d-d4b6-414b-869b-b429769fce34_2048x.png?v=1531192391",
        "price": 100.99
      };

      customParts.add(customMap1);
      customParts.add(customMap2);
      customParts.add(customMap3);

      responseData = customParts;
    }

    return parseParts(responseData);
  }

  List<Part> parseParts(List<dynamic> jsonResponse) {
    final _data = Parts.fromJson(jsonResponse);

    print("Fechou :DD");
    dio.close();
    return _data.parts;
  }
}
