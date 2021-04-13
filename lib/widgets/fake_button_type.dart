import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/helpers/helpers.dart';

class FakeButtonType extends StatelessWidget {
  final String type;
  const FakeButtonType(
    this.type,
  );
  @override
  Widget build(BuildContext context) {
    final typeMap = getPokemonType(type);
    final Color color = typeMap['color'];
    final String assetUrl = typeMap['asset'];
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: 130,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (assetUrl != '')
              ? SvgPicture.asset(
                  assetUrl,
                )
              : Icon(
                  Icons.not_interested,
                  color: Colors.white,
                  // size: size,
                ),
          Text(
            type.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
