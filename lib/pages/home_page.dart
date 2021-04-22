import 'package:flutter/material.dart';
import 'package:pokeapp/models/slider_home_model.dart';
import 'package:pokeapp/widgets/custom_Bottom_navigation_bar.dart';
import 'package:pokeapp/widgets/header_main.dart';
import 'package:pokeapp/widgets/move_list.dart';
import 'package:pokeapp/widgets/pokemon_list.dart';
import 'package:pokeapp/widgets/Item_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderHomeModel(),
      child: Scaffold(
        body: Column(
          children: [
            HeaderMain(),
            Expanded(child: _HomePageView()),
            SizedBox()
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}

class _HomePageView extends StatefulWidget {
  @override
  __HomePageViewState createState() => __HomePageViewState();
}

class __HomePageViewState extends State<_HomePageView> {
  @override
  Widget build(BuildContext context) {
    final pageViewModel = Provider.of<SliderHomeModel>(context, listen: false);
    final pageView = PageView(
      onPageChanged: (i) => pageViewModel.currentPage = i,
      controller: pageViewModel.controller,
      children: [
        PokemonListView(),
        MoveList(),
        ItemList(),
      ],
    );
    return pageView;
  }
}
