import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/models/move_list_model.dart';
import 'package:pokeapp/widgets/detail_description.dart';
import 'package:pokeapp/widgets/detail_view.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/widgets/fake_button_type.dart';

class MoveDetailPage extends StatelessWidget {
  final String? heroTag;
  final MoveList? move;

  const MoveDetailPage({this.heroTag, this.move});

  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType(move!.data!.type!.name);
    final Color? color = typeMap['color'];
    final Color? color2 = typeMap['color2'];
    return DetailView(
      heroTag: heroTag,
      urlImage: '',
      typeMap: typeMap,
      color: color,
      color2: color2,
      name: move!.name,
      assetType: move!.data!.type!.name,
      child: Container(
        width: double.infinity,
        child: FadeInRight(
          duration: Duration(milliseconds: 500),
          child: Column(
            children: [
              SizedBox(height: 50),
              FadeInRight(
                child: Text(move!.name!,
                    style: TextStyle(fontSize: 50, color: Color(0xff4F4F4F))),
              ),
              FakeButtonType(move!.data!.type!.name),
              DetailDescription(move!.data!.effectEntries![0].effect),
              _Details(color: color, move: move),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final Color? color;
  final MoveList? move;

  const _Details({this.color, this.move});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Detail(
              color: color,
              title: 'Base Power',
              content: move!.data!.power.toString()),
          Divider(),
          _Detail(
              color: color,
              title: 'Acurracy',
              content: '${move!.data!.accuracy}%'),
          Divider(),
          _Detail(color: color, title: 'PP', content: move!.data!.pp.toString()),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  final String title;
  final String content;
  final Color? color;

  const _Detail(
      {required this.color, required this.title, required this.content});

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
