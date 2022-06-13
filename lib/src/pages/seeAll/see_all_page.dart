import 'package:flutter/material.dart';
import 'package:marvel/src/commons/background.dart';

/// My Classes
import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/pages/seeAll/components/fullListComics.dart';
import 'package:marvel/src/pages/seeAll/components/fullListEvents.dart';
import 'package:marvel/src/pages/seeAll/components/fullListSeries.dart';
import 'components/fullListCharacters.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key key, this.title, this.index, this.url})
      : super(key: key);

  final String title, url;
  final int index;

  @override
  _SeeAllPageState createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Widget> listas = [
      null,
      FullListCharacters(url: widget.url),
      FullListComics(url: widget.url),
      FullListEvents(url: widget.url),
      FullListSeries(url: widget.url)
    ];

    final List<String> images = [
      'assets/images/background.jpg',
      'assets/images/characters.jpg',
      'assets/images/comics.jpg',
      'assets/images/events.jpg',
      'assets/images/series.jpg'
    ];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TitleMenu(title: widget.title.toUpperCase()),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(children: [
          Background(image: images[widget.index]),
          listas[widget.index]
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
