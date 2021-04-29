import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/models/pokemon_list_model.dart';
import 'package:pokeapp/pages/pokemon_detail_page.dart';
import 'package:pokeapp/providers/pokemon_list_provider.dart';
import 'package:pokeapp/utils/dialog_pokemon.dart';
import 'package:pokeapp/widgets/TypePokemon.dart';

class PokemonListView extends StatefulWidget {
  final List<dynamic> pokemonList = [];
  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final pokemonListProvider = PokemonListProvider();
  int currentLength = 0;
  final int increment = 15;
  bool isLoading = false;

  @override
  void initState() {
    currentLength = widget.pokemonList.length;
    if (widget.pokemonList.length == 0 && mounted) _loadMore();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.pokemonList.length > increment)
      widget.pokemonList.removeRange(increment, widget.pokemonList.length - 1);
    super.dispose();
  }

  Future _loadMore() async {
    // print('begin');
    setState(() {
      isLoading = true;
    });

    widget.pokemonList.addAll(
        await pokemonListProvider.getPokemonList(currentLength, increment));
    // print('end');
    if (mounted) {
      setState(() {
        isLoading = false;
        currentLength = widget.pokemonList.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.pokemonList.length > 0)
        ? Scrollbar(
            child: LazyLoadScrollView(
              isLoading: isLoading,
              onEndOfPage: () => _loadMore(),
              scrollOffset: 150,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: widget.pokemonList.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                myOwnRoute(
                                  PokemonDetailPage(
                                      index: index,
                                      pokemon: widget.pokemonList[index]),
                                ),
                              );
                            },
                            child: _CustomListTile(
                                index, widget.pokemonList[index])),
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
  final PokemonList pokemon;

  const _CustomListTile(this.index, this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      // esto por que el Gesturedetector no reconoce el tap en el centro
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onLongPress: () => showStregths(context, pokemon),
            child: Container(
              height: 45,
              width: 45,
              child: Hero(
                tag: '$index-${pokemon.name}',
                child: Image.network(
                  pokemon.data!.sprites!.other!.officialArtwork!.frontDefault!,
                  filterQuality: FilterQuality.high,
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
          ),
          SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onLongPress: () => showStregths(context, pokemon),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pokemon.name!,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '#${pokemon.data!.id.toString().padLeft(3, '0')}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xffA4A4A4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: pokemon.data!.types!
                .map((e) => Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TypePokemon(type: e.type!.name)))
                .toList(),
          )
        ],
      ),
    );
  }
}
