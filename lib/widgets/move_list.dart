import 'package:flutter/material.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/pages/move_detail_page.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';
import 'package:pokeapp/widgets/home_list_view.dart';

class MoveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeListView(List.generate(20, (index) => _CustomListTile(index)));
  }
}

class MoveListFixed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(),
      ...List.generate(
          20, (index) => Column(children: [_CustomListTile(index), Divider()]))
    ]);
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;

  const _CustomListTile(this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, myOwnRoute(MoveDetailPage(heroTag: '$index-flying'))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'wing-attack',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Hero(tag: '$index-flying', child: TypePokemon(type: 'flying')),
          ],
        ),
      ),
    );
  }
}
