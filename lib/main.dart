import 'package:flutter/material.dart';

import 'assets/colors.dart';
import 'ui/menu.dart';

void main() => runApp(OnPecas());

class OnPecas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnPecas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: blueOnpecas),
      home: Menu(),
    );
  }
}
