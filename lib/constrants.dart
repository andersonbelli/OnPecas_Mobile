import 'package:flutter/material.dart';

// [{"name":"Escapamento","price":20.0},{"name":"Motor","price":450.0},{"name":"Roda","price":22.0}]

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(16, 116, 186, .1),
  100: Color.fromRGBO(16, 116, 186, .2),
  200: Color.fromRGBO(16, 116, 186, .3),
  300: Color.fromRGBO(16, 116, 186, .4),
  400: Color.fromRGBO(16, 116, 186, .5),
  500: Color.fromRGBO(16, 116, 186, .6),
  600: Color.fromRGBO(16, 116, 186, .7),
  700: Color.fromRGBO(16, 116, 186, .8),
  800: Color.fromRGBO(16, 116, 186, .9),
  900: Color.fromRGBO(16, 116, 186, 1),
};

final Color blueOnpecas = Color.fromRGBO(16, 116, 186, 1);

const BASE_URL = "https://onpecas.herokuapp.com/api/parts/?format=json";