import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/widgets/detail_description.dart';
import 'package:pokeapp/widgets/detail_view.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/widgets/fake_button_type.dart';

class MoveDetailPage extends StatelessWidget {
  final String heroTag;

  const MoveDetailPage({this.heroTag});

  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType('flying');
    final Color color = typeMap['color'];
    final Color color2 = typeMap['color2'];
    return DetailView(
      heroTag: heroTag,
      urlImage: '',
      typeMap: typeMap,
      color: color,
      color2: color2,
      name: 'nombre',
      assetType: 'flying',
      child: Container(
        width: double.infinity,
        child: FadeInRight(
          duration: Duration(milliseconds: 500),
          child: Column(
            children: [
              SizedBox(height: 50),
              FadeInRight(
                child: Text('wing-attack',
                    style: TextStyle(fontSize: 50, color: Color(0xff4F4F4F))),
              ),
              FakeButtonType('flying'),
              DetailDescription(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              _Details(color: color),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final Color color;

  const _Details({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Detail(color: color, title: 'Base Power', content: '40'),
          Divider(),
          _Detail(color: color, title: 'Acurracy', content: '100%'),
          Divider(),
          _Detail(color: color, title: 'PP', content: '30'),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  final String title;
  final String content;
  final Color color;

  const _Detail(
      {@required this.color, @required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(color: color, fontSize: 20),
        ),
        SizedBox(height: 5),
        Text(
          content,
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
