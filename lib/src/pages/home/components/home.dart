import 'package:flutter/material.dart';
import 'package:marvel/src/commons/background.dart';

import '../../../size_config.dart';
import 'exampleListCharacters.dart';
import 'exampleListComics.dart';
import 'exampleListEvents.dart';
import 'exampleListSeries.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Stack(children: [
        Background(image: 'assets/images/background.jpg'),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            //ListCategories(),
            ExampleListCharacters(),
            ExampleListComics(),
            ExampleListEvents(),
            ExampleListSeries(),
            SizedBox(height: getProportionateScreenHeight(5))
          ]),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
