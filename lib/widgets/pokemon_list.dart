import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/pages/pokemon_detail_page.dart';
import 'package:pokeapp/utils/dialog_pokemon.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';

import 'home_list_view.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeListView(List.generate(20, (i) => _CustomListTile(i)));
  }
}

class _CustomListTile extends StatelessWidget {
  final int index;

  const _CustomListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            myOwnRoute(PokemonDetailPage(
                urlImage:
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                heroTag: '$index-bulbasaur')));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onLongPress: () => showStregths(context),
              child: Container(
                height: 45,
                width: 45,

                // child: FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image:
                //       'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                // ),
                child: Hero(
                  tag: '$index-bulbasaur',
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                    filterQuality: FilterQuality.high,
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
            ),
            SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onLongPress: () => showStregths(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bulbasaur',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '#001',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffA4A4A4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                TypePokemon(type: 'grass'),
                SizedBox(width: 10),
                TypePokemon(type: 'poison'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
