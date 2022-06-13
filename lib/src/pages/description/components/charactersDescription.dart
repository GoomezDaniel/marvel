import 'package:flutter/material.dart';
import 'package:marvel/src/commons/listEventsDescription.dart';
import 'package:marvel/src/commons/listSeriesDescription.dart';
import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/models/characters.dart';

import '../../../size_config.dart';

class CharactersDescription extends StatefulWidget {
  const CharactersDescription({
    Key key,
    this.character,
  }) : super(key: key);

  final ResultCharacter character;

  @override
  _CharactersDescriptionState createState() => _CharactersDescriptionState();
}

class _CharactersDescriptionState extends State<CharactersDescription> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              padding: EdgeInsets.all(8),
              icon: Container(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back_outlined,
                    color: Theme.of(context).primaryColor),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
              onPressed: () => Navigator.pop(context)),
          stretch: true,
          expandedHeight: getProportionateScreenHeight(300),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
            ],
            background: Hero(
              tag: widget.character.id.toString(),
              child: Image.network(
                '${widget.character.thumbnail.path.replaceAll('http', 'https')}.${widget.character.thumbnail.ext}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TitleObject(title: widget.character.title),
          widget.character.description != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: DescriptionObject(title: widget.character.description),
                )
              : Opacity(opacity: 0.0),
          widget.character.series.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Series',
                      length: widget.character.series.available,
                      url: widget.character.series.collectionUri,
                      index: 4),
                  ListSeriesDescription(serie: widget.character)
                ])
              : Opacity(opacity: 0.0),
          widget.character.events.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Events',
                      length: widget.character.events.available,
                      url: widget.character.events.collectionUri,
                      index: 3),
                  ListEventsDescription(event: widget.character)
                ])
              : Opacity(opacity: 0.0),
          SizedBox(height: getProportionateScreenHeight(10))
        ]))
      ],
    );
  }
}
