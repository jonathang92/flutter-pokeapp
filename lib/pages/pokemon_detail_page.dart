import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapp/widgets/detail_description.dart';
import 'package:pokeapp/widgets/detail_view.dart';
import 'package:pokeapp/helpers/helpers.dart';
import 'package:pokeapp/widgets/fake_button_type.dart';
import 'package:pokeapp/widgets/move_list.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {
  final String heroTag;
  final String urlImage;

  const PokemonDetailPage({this.heroTag, this.urlImage});

  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType('grass');
    final Color color = typeMap['color'];
    final Color color2 = typeMap['color2'];
    return DetailView(
      heroTag: heroTag,
      urlImage: urlImage,
      typeMap: typeMap,
      color: color,
      color2: color2,
      child: ChangeNotifierProvider(
        create: (_) => new PokemonDetailPageModel(),
        child: Container(
          width: double.infinity,
          child: Builder(builder: (BuildContext context) {
            final activePage =
                Provider.of<PokemonDetailPageModel>(context).currentPage;

            return FadeInLeft(
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  FadeInRight(
                    child: Text('Bulbasaur',
                        style:
                            TextStyle(fontSize: 50, color: Color(0xff4F4F4F))),
                  ),
                  FakeButtonType('grass'),
                  _DetailNavigationBar(color: color),
                  if (activePage == 1) ...[
                    _StatsView(color: color, color2: color2)
                  ],
                  if (activePage == 2) ...[_EvolutionsView(color: color)],
                  if (activePage == 3) ...[_Moves()],
                  SizedBox(height: 50)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _Moves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 20),
      child: MoveListFixed(),
    );
  }
}

class _EvolutionsView extends StatelessWidget {
  final Color color;

  const _EvolutionsView({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _EvolutionStep(
            color: color,
            level: 16,
            preEvolutionUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
            evolutionUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
            preEvolutionName: 'Bulbasaur',
            evolutionName: 'Ivysaur',
          ),
          _EvolutionStep(
            color: color,
            level: 32,
            preEvolutionUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
            evolutionUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
            preEvolutionName: 'Ivysaur',
            evolutionName: 'Venusaur',
          ),
        ],
      ),
    );
  }
}

class _EvolutionStep extends StatelessWidget {
  final Color color;
  final int level;
  final String preEvolutionUrl;
  final String evolutionUrl;
  final String preEvolutionName;
  final String evolutionName;

  const _EvolutionStep({
    @required this.color,
    @required this.level,
    @required this.preEvolutionUrl,
    @required this.evolutionUrl,
    @required this.preEvolutionName,
    @required this.evolutionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _EvolutionPokemon(preEvolutionUrl, preEvolutionName),
          Column(
            children: [
              Text('LV.$level', style: TextStyle(color: color, fontSize: 20)),
              FaIcon(Icons.arrow_forward, color: Color(0xff4F4F4F), size: 30),
            ],
          ),
          _EvolutionPokemon(evolutionUrl, evolutionName),
        ],
      ),
    );
  }
}

class _EvolutionPokemon extends StatelessWidget {
  final String evolutionUrl;
  final String evolutionName;

  const _EvolutionPokemon(
    this.evolutionUrl,
    this.evolutionName,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: Image.network(
            evolutionUrl,
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
        Text(
          evolutionName,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class _StatsView extends StatelessWidget {
  final Color color;
  final Color color2;
  const _StatsView({@required this.color, @required this.color2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailDescription(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
        _Stats(color: color, color2: color2),
        _Abilities(color: color),
        _Sprites(color: color),
      ],
    );
  }
}

class _Sprites extends StatelessWidget {
  final Color color;
  const _Sprites({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _Title('Sprites', color),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Sprite(color, 'Normal',
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),
              _Sprite(color, 'Shiny',
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Sprite extends StatelessWidget {
  final String title;
  final String url;
  final Color color;
  const _Sprite(this.color, this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: color, fontSize: 20),
        ),
        Container(
          width: 100,
          child: Image.network(
            url,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _DetailNavigationBar extends StatelessWidget {
  final Color color;
  const _DetailNavigationBar({
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ButtonNavigationBar(1, color, 'STATS'),
          _ButtonNavigationBar(2, color, 'EVOLUTIONS'),
          _ButtonNavigationBar(3, color, 'MOVES'),
        ],
      ),
    );
  }
}

class _ButtonNavigationBar extends StatefulWidget {
  final Color color;
  final String title;
  final int activePage;

  const _ButtonNavigationBar(this.activePage, this.color, this.title);

  @override
  __ButtonNavigationBarState createState() => __ButtonNavigationBarState();
}

class __ButtonNavigationBarState extends State<_ButtonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final active = (Provider.of<PokemonDetailPageModel>(context).currentPage ==
            widget.activePage)
        ? true
        : false;
    return Expanded(
      child: GestureDetector(
        onTap: () async => setState(() {
          Provider.of<DetailPageModel>(context, listen: false)
              .animatedScrollOffset = 0.0;
          Provider.of<PokemonDetailPageModel>(context, listen: false)
              .currentPage = widget.activePage;
        }),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: (active) ? widget.color : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          height: 50,
          child: Center(
              child: Text(
            widget.title,
            style: TextStyle(
                color: (active) ? Colors.white : widget.color, fontSize: 20),
          )),
        ),
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  final Color color;
  final Color color2;
  const _Stats({
    @required this.color,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // _Title('Stats', color),
          _StatElement(text: 'HP', percent: 30, color: color, color2: color2),
          _StatElement(text: 'ATK', percent: 10, color: color, color2: color2),
          _StatElement(text: 'DEF', percent: 40, color: color, color2: color2),
          _StatElement(text: 'SATK', percent: 60, color: color, color2: color2),
          _StatElement(text: 'SDEF', percent: 20, color: color, color2: color2),
          _StatElement(text: 'SPD', percent: 100, color: color, color2: color2),
        ],
      ),
    );
  }
}

class _StatElement extends StatelessWidget {
  final String text;
  final int percent;
  final Color color;
  final Color color2;
  const _StatElement({
    @required this.text,
    @required this.percent,
    @required this.color,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = 18.0;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 35),
            child: Text(
              text.toUpperCase(),
              style: TextStyle(color: color, fontSize: fontSize),
            ),
          ),
          Text((percent >= 100) ? percent.toString() : '0${percent.toString()}',
              style: TextStyle(fontSize: fontSize)),
          _Graph(color, color2, percent),
        ],
      ),
    );
  }
}

class _Graph extends StatelessWidget {
  final Color color;
  final Color color2;
  final int percent;
  const _Graph(
    this.color,
    this.color2,
    this.percent,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final graphSize = screenSize.width * 0.65;
    final graphHeight = 12.0;
    return Stack(
      children: [
        Container(
          width: graphSize,
          height: graphHeight,
          decoration: BoxDecoration(
            color: Color(0xffF0F0F0),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        Container(
          width: graphSize * 0.01 * percent,
          height: graphHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color2, color],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ],
    );
  }
}

class _Abilities extends StatelessWidget {
  final Color color;
  const _Abilities({
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _Title('Abilities', color),
          _Ability(
            name: 'Torrent',
            description:
                'Powers up Water-type moves when the Pokémon is in trouble.',
            color: color,
          ),
          _Ability(
            name: 'Torrent',
            description:
                'Powers up Water-type moves when the Pokémon is in trouble.',
            color: color,
          ),
          _Ability(
            name: 'Torrent',
            description:
                'Powers up Water-type moves when the Pokémon is in trouble.',
            color: color,
          ),
          _Ability(
            name: 'Torrent',
            description:
                'Powers up Water-type moves when the Pokémon is in trouble.',
            color: color,
          ),
        ],
      ),
    );
  }
}

class _Ability extends StatelessWidget {
  const _Ability({
    @required this.name,
    @required this.color,
    @required this.description,
  });

  final String name;
  final Color color;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(color: color, fontSize: 20)),
          Text(description, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  final Color color;
  const _Title(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: color, fontSize: 25),
      )),
    );
  }
}

class PokemonDetailPageModel with ChangeNotifier {
  int _currentPage = 1;

  int get currentPage => this._currentPage;

  set currentPage(int v) {
    this._currentPage = v;
    notifyListeners();
  }
}
