import 'package:flutter/material.dart';

Map getPokemonType(type) {
  final Map types = {
    'bug': {
      'color': Color(0xff92BC2C),
      'color2': Color(0xffAFC836),
      'asset': 'assets/svg/type-bug.svg'
    },
    'dark': {
      'color': Color(0xff595761),
      'color2': Color(0xff6E7587),
      'asset': 'assets/svg/type-dark.svg'
    },
    'dragon': {
      'color': Color(0xff0C69C8),
      'color2': Color(0xff0180C7),
      'asset': 'assets/svg/type-dragon.svg'
    },
    'electric': {
      'color': Color(0xffEDD53E),
      'color2': Color(0xffFBE273),
      'asset': 'assets/svg/type-electric.svg'
    },
    'fairy': {
      'color': Color(0xffEC8CE5),
      'color2': Color(0xffF3A7E7),
      'asset': 'assets/svg/type-fairy.svg'
    },
    'fighting': {
      'color': Color(0xffCE4265),
      'color2': Color(0xffE74347),
      'asset': 'assets/svg/type-fight.svg'
    },
    'fire': {
      'color': Color(0xffFB9B51),
      'color2': Color(0xffFBAE46),
      'asset': 'assets/svg/type-fire.svg'
    },
    'flying': {
      'color': Color(0xff90A7DA),
      'color2': Color(0xffA6C2F2),
      'asset': 'assets/svg/type-flying.svg'
    },
    'ghost': {
      'color': Color(0xff516AAC),
      'color2': Color(0xff7773D4),
      'asset': 'assets/svg/type-ghost.svg'
    },
    'grass': {
      'color': Color(0xff5FBC51),
      'color2': Color(0xff5AC178),
      'asset': 'assets/svg/type-grass.svg'
    },
    'ground': {
      'color': Color(0xffDC7545),
      'color2': Color(0xffD29463),
      'asset': 'assets/svg/type-ground.svg'
    },
    'ice': {
      'color': Color(0xff70CCBD),
      'color2': Color(0xff8CDDD4),
      'asset': 'assets/svg/type-ice.svg'
    },
    'normal': {
      'color': Color(0xff9298A4),
      'color2': Color(0xffA3A49E),
      'asset': 'assets/svg/type-normal.svg'
    },
    'poison': {
      'color': Color(0xffA864C7),
      'color2': Color(0xffB3C261D4),
      'asset': 'assets/svg/type-poison.svg'
    },
    'psychic': {
      'color': Color(0xffF66F71),
      'color2': Color(0xffFE9F92),
      'asset': 'assets/svg/type-psychic.svg'
    },
    'rock': {
      'color': Color(0xffC5B489),
      'color2': Color(0xffD7CD90),
      'asset': 'assets/svg/type-rock.svg'
    },
    'steel': {
      'color': Color(0xff52869D),
      'color2': Color(0xff58A6AA),
      'asset': 'assets/svg/type-steel.svg'
    },
    'water': {
      'color': Color(0xff4A90DD),
      'color2': Color(0xff6CBDE4),
      'asset': 'assets/svg/type-water.svg'
    },
    'unknown': {
      'color': Color(0xff52869D),
      'color2': Color(0xff58A6AA),
      'asset': ''
    },
    'shadow': {
      'color': Color(0xff595761),
      'color2': Color(0xffCE4265),
      'asset': ''
    },
    'item-color': {
      'color': Color(0xff84E090),
      'color2': Color(0xff75DEDD),
      'asset': ''
    },
  };
  final result = types.containsKey(type);
  if (result) {
    return types[type];
  }
  return types['unknown'];
}

Route myOwnRoute(Widget page) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          page,
      transitionDuration: Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      });
}
