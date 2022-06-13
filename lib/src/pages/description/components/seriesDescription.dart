import 'package:flutter/material.dart';
import 'package:marvel/src/commons/listComicsDescription.dart';
import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/models/series.dart';

import '../../../size_config.dart';

class SeriesDescription extends StatefulWidget {
  const SeriesDescription({
    Key key,
    this.series,
  }) : super(key: key);

  final ResultSeries series;

  @override
  _SeriesDescriptionState createState() => _SeriesDescriptionState();
}

class _SeriesDescriptionState extends State<SeriesDescription> {
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
                    color: Theme.of(context).accentColor),
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
              tag: widget.series.id.toString(),
              child: Image.network(
                '${widget.series.thumbnail.path.replaceAll('http', 'https')}.${widget.series.thumbnail.ext}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TitleObject(title: widget.series.title),
          widget.series.description != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DescriptionObject(title: widget.series.description),
                )
              : Opacity(opacity: 0.0),
          widget.series.comics.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Comics',
                      length: widget.series.comics.available,
                      url: widget.series.comics.collectionUri,
                      index: 2),
                  ListComicsDescription(comic: widget.series)
                ])
              : Opacity(opacity: 0.0),
          SizedBox(height: getProportionateScreenHeight(10))
        ]))
      ],
    );
  }
}
