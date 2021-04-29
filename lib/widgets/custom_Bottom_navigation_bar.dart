import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokeapp/models/slider_home_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [_Background1(), _Background2(), _NavItems()],
    );
  }
}

class _NavItems extends StatefulWidget {
  @override
  __NavItemsState createState() => __NavItemsState();
}

class __NavItemsState extends State<_NavItems> {
  @override
  Widget build(BuildContext context) {
    final sliderHomeModel = Provider.of<SliderHomeModel>(context);
    void open(i) {
      sliderHomeModel.controller.animateToPage(i,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      sliderHomeModel.currentPage = i;
    }

    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 66,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              open(0);
            }),
            child: _Item(
              text: 'Pokemon',
              icon: Icons.android_outlined,
              active: sliderHomeModel.currentPage == 0,
              // active: (sliderHomeModel.currentPage >= 0 - 0.5 &&
              //     sliderHomeModel.currentPage < 0 + 0.5)),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              open(1);
            }),
            child: _Item(
              text: 'Moves',
              icon: Icons.games_outlined,
              active: sliderHomeModel.currentPage == 1,
              // active: (sliderHomeModel.currentPage >= 1 - 0.5 &&
              //     sliderHomeModel.currentPage < 1 + 0.5)),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              open(2);
            }),
            child: _Item(
              text: 'Items',
              icon: Icons.backpack_outlined,
              active: sliderHomeModel.currentPage == 2,
              // active: (sliderHomeModel.currentPage >= 2 - 0.5 &&
              //     sliderHomeModel.currentPage < 2 + 0.5)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool active;

  _Item({required this.text, required this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: (!this.active) ? Colors.black45 : Colors.black,
        ),
        Text(
          this.text,
          style: TextStyle(
            color: (!this.active) ? Colors.black45 : Colors.black,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}

class _Background2 extends StatelessWidget {
  const _Background2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      decoration: BoxDecoration(color: Color(0xffCCFAFAFA)),
    );
  }
}

class _Background1 extends StatelessWidget {
  const _Background1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: [0.08, 0.40, 0.60, 1],
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
