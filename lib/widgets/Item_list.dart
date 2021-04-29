import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/models/item_list_model.dart';
import 'package:pokeapp/pages/item_detail_page.dart';
import 'package:pokeapp/providers/item_list_provider.dart';

class ItemListView extends StatefulWidget {
  final List<dynamic> itemList = [];
  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  final itemListProvider = ItemListProvider();
  int currentLength = 0;
  final int increment = 15;
  bool isLoading = false;

  @override
  void initState() {
    currentLength = widget.itemList.length;
    if (widget.itemList.length == 0 && mounted) _loadMore();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.itemList.length > increment)
      widget.itemList.removeRange(increment, widget.itemList.length - 1);
    super.dispose();
  }

  Future _loadMore() async {
    // print('begin');
    setState(() {
      isLoading = true;
    });

    widget.itemList
        .addAll(await itemListProvider.getItemList(currentLength, increment));
    // print('end');
    if (mounted) {
      setState(() {
        isLoading = false;
        currentLength = widget.itemList.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.itemList.length > 0)
        ? Scrollbar(
            child: LazyLoadScrollView(
              isLoading: isLoading,
              onEndOfPage: () => _loadMore(),
              scrollOffset: 150,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: widget.itemList.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        _CustomListTile(index, widget.itemList[index]),
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
              valueColor: AlwaysStoppedAnimation<Color?>(Colors.green[200]),
            ),
          );
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;
  final ItemList item;
  const _CustomListTile(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          myOwnRoute(ItemDetailPage(
            urlImage: item.data!.sprites!.spritesDefault,
            heroTag: '$index-${item.name}',
            item: item,
          ))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: Hero(
                tag: '$index-${item.name}',
                child: Image.network(
                  item.data!.sprites!.spritesDefault!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: FaIcon(
                      FontAwesomeIcons.timesCircle,
                      color: Colors.red[600],
                    )); //do something
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color?>(Colors.grey[300]),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                item.name!,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              item.data!.cost.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffA4A4A4),
              ),
            ),
            Text(
              '\$',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, fontFamily: 'Pokemongb'),
            ),
          ],
        ),
      ),
    );
  }
}
