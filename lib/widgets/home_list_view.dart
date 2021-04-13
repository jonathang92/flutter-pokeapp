import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  final List<Widget> elements;

  const HomeListView(this.elements);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        // physics: BouncingScrollPhysics(),
        physics: ClampingScrollPhysics(),
        children:
            elements.map((e) => Column(children: [e, Divider()])).toList(),
      ),
    );
  }
}
