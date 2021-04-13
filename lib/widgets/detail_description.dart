import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  final String texto;
  const DetailDescription(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Text(
        texto,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
