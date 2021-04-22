import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapp/models/pokemon_list_model.dart';
import 'package:pokeapp/models/pokemon_model.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';

void showStregths(BuildContext context, PokemonList pokemon) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  _CustomHeader(pokemon),
                  Divider(),
                  _GridElements(pokemon)
                ],
              ),
            ));
      });
}

class _GridElements extends StatelessWidget {
  final PokemonList pokemon;

  const _GridElements(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          // primary: false,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          childAspectRatio: 24 / 10,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
              18,
              (index) => Container(
                    // color: Colors.red,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TypePokemon(type: 'grass'),
                          Text('1x', style: TextStyle(fontSize: 25)),
                        ]),
                  )),
        ),
      ),
    );
  }
}

class _CustomHeader extends StatelessWidget {
  final PokemonList pokemon;

  const _CustomHeader(this.pokemon);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          child: Image.network(
            pokemon.data.sprites.other.officialArtwork.frontDefault,
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pokemon.name,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '#${pokemon.data.id.toString().padLeft(3, '0')}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffA4A4A4),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: pokemon.data.types
              .map((e) => Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TypePokemon(type: e.type.name)))
              .toList(),
        )
      ],
    );
  }
}
