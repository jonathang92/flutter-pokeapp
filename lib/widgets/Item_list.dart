import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/pages/item_detail_page.dart';

import 'home_list_view.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeListView(List.generate(20, (index) => _CustomListTile(index)));
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;

  const _CustomListTile(this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          myOwnRoute(ItemDetailPage(
              urlImage:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png',
              heroTag: '$index-master-ball'))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: Hero(
                tag: '$index-master-ball',
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: FaIcon(
                      FontAwesomeIcons.timesCircle,
                      color: Colors.red[600],
                    )); //do something
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.grey[300]),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
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
                'Master Ball',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              '200',
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
