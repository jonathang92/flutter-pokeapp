import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  final String? texto;
  const DetailDescription(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Text(
        texto!.replaceAll("\f", " "),
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
