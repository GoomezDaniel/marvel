import 'package:flutter/material.dart';
import 'package:marvel/src/commons/listCharactersDescription.dart';
import 'package:marvel/src/commons/listSeriesDescription.dart';
import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/models/events.dart';

import '../../../size_config.dart';

class EventsDescription extends StatefulWidget {
  const EventsDescription({
    Key key,
    this.events,
  }) : super(key: key);

  final ResultEvents events;

  @override
  _EventsDescriptionState createState() => _EventsDescriptionState();
}

class _EventsDescriptionState extends State<EventsDescription> {
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
              tag: widget.events.id.toString(),
              child: Image.network(
                '${widget.events.thumbnail.path.replaceAll('http', 'https')}/portrait_uncanny.${widget.events.thumbnail.ext}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TitleObject(title: widget.events.title),
          widget.events.description != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DescriptionObject(title: widget.events.description),
                )
              : Opacity(opacity: 0.0),
          widget.events.characters.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Characters',
                      length: widget.events.characters.available,
                      url: widget.events.characters.collectionUri,
                      index: 1),
                  ListCharactersDescription(character: widget.events)
                ])
              : Opacity(opacity: 0.0),
          widget.events.series.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Series',
                      length: widget.events.series.available,
                      url: widget.events.series.collectionUri,
                      index: 4),
                  ListSeriesDescription(serie: widget.events)
                ])
              : Opacity(opacity: 0.0),
          SizedBox(height: getProportionateScreenHeight(10))
        ]))
      ],
    );
  }
}
