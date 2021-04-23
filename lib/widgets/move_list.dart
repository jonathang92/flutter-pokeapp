import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokeapp/models/move_list_model.dart';
import 'package:pokeapp/providers/move_list_provider.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/pages/move_detail_page.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';

class MoveListView extends StatefulWidget {
  final List<dynamic> moveList = [];
  @override
  _MoveListViewState createState() => _MoveListViewState();
}

class _MoveListViewState extends State<MoveListView> {
  final moveListProvider = MoveListProvider();
  int currentLength = 0;
  final int increment = 15;
  bool isLoading = false;

  @override
  void initState() {
    currentLength = widget.moveList.length;
    if (widget.moveList.length == 0 && mounted) _loadMore();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.moveList.length > increment)
      widget.moveList.removeRange(increment, widget.moveList.length - 1);
    super.dispose();
  }

  Future _loadMore() async {
    // print('begin');
    setState(() {
      isLoading = true;
    });

    widget.moveList
        .addAll(await moveListProvider.getMoveList(currentLength, increment));
    // print('end');
    if (mounted) {
      setState(() {
        isLoading = false;
        currentLength = widget.moveList.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.moveList.length > 0)
        ? Scrollbar(
            child: LazyLoadScrollView(
              isLoading: isLoading,
              onEndOfPage: () => _loadMore(),
              scrollOffset: 150,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: widget.moveList.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        _CustomListTile(index, widget.moveList[index]),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green[200]),
            ),
          );
  }
}

class MoveListFixed extends StatelessWidget {
  final List<MoveList> moves;
  const MoveListFixed({this.moves});
  @override
  Widget build(BuildContext context) {
    int c = 0;
    return Column(
        children: moves
            .map((MoveList move) => Column(children: [
                  _CustomListTile(c++, move),
                  Divider(),
                ]))
            .toList());
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;
  final MoveList move;

  const _CustomListTile(this.index, this.move);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          myOwnRoute(
              MoveDetailPage(heroTag: '$index-${move.name}', move: move))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            SizedBox(width: 15),
            Expanded(
              child: Text(
                move.name,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Hero(
                tag: '$index-${move.name}',
                child: TypePokemon(type: move.data.type.name)),
          ],
        ),
      ),
    );
  }
}
