import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/helpers/helpers.dart';

class TypePokemon extends StatelessWidget {
  final String? type;
  final Function? action;
  final double? width;
  final double padding;
  TypePokemon(
      {required this.type, this.action, this.width, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType(this.type);
    final Color? color = typeMap['color'];
    final Color color2 = typeMap['color2'];
    final String? assetName = typeMap['asset'];
    return Container(
      child: (assetName != '')
          ? SvgPicture.asset(
              assetName!,
              width: width,
            )
          : Icon(
              Icons.not_interested,
              color: Colors.white,
              size: width,
              // size: size,
            ),
      // child: Icon(Icons.grass, color: Colors.white),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color!, color2],
        ),
        boxShadow: [
          BoxShadow(
            color: color2,
            // offset: Offset(4, 6),
            // spreadRadius: 1,
            blurRadius: 8,
          )
        ],
      ),
    );
  }
}
