import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/models/item_list_model.dart';
import 'package:pokeapp/widgets/detail_view.dart';
import 'package:pokeapp/helpers/helpers.dart';

class ItemDetailPage extends StatelessWidget {
  final String heroTag;
  final String urlImage;
  final ItemList item;

  const ItemDetailPage({this.heroTag, this.urlImage, this.item});

  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType('item-color');
    final Color color = typeMap['color'];
    final Color color2 = typeMap['color2'];
    // final String assetImage = typeMap['asset'];
    return DetailView(
      heroTag: heroTag,
      urlImage: urlImage,
      typeMap: typeMap,
      color: color,
      color2: color2,
      name: item.name,
      child: Container(
        width: double.infinity,
        child: FadeInRight(
          duration: Duration(milliseconds: 500),
          child: Column(
            children: [
              SizedBox(height: 50),
              FadeInRight(
                child: Text(item.name,
                    style: TextStyle(fontSize: 50, color: Color(0xff4F4F4F))),
              ),
              _Price(price: item.data.cost.toString()),
              _Description(text: item.data.effectEntries[0].effect),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String text;
  const _Description({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Text(text.replaceAll('\n', '').replaceAll('\f', ''),
          textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
    );
  }
}

class _Price extends StatelessWidget {
  final String price;
  const _Price({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
              color: Color(0xffA4A4A4),
            ),
          ),
          SizedBox(width: 5),
          Text(
            '\$',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontFamily: 'Pokemongb'),
          ),
        ],
      ),
    );
  }
}
