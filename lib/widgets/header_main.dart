import 'package:flutter/material.dart';

class HeaderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_Background1(), _Background2(), _TitleAndSearch()],
    );
  }
}

class _TitleAndSearch extends StatelessWidget {
  const _TitleAndSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text('Pokemon', style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Color(0xff334F4F4F),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 22,
                    color: Color(0xff4F4F4F),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 22),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                          // contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Search"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Background1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dimensiones de la pantalla
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: [
          0.08,
          0.40,
          0.60,
          1,
        ],
        begin: Alignment.topLeft,
        colors: [
          Color(0xff6E95FD),
          Color(0xff6FDEFA),
          Color(0xff8DE061),
          Color(0xff51E85E),
        ],
      )),
    );
  }
}

class _Background2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dimensiones de la pantalla
    return Container(
      width: double.infinity,
      height: 156,
      decoration: BoxDecoration(color: Color(0xffCCFAFAFA)),
    );
  }
}
