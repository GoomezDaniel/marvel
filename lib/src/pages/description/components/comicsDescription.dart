import 'package:flutter/material.dart';
import 'package:marvel/src/commons/listCharactersDescription.dart';
import 'package:marvel/src/commons/listEventsDescription.dart';
import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/models/comics.dart';

import '../../../size_config.dart';

class ComicsDescription extends StatefulWidget {
  const ComicsDescription({
    Key key,
    this.comics,
  }) : super(key: key);

  final ResultComics comics;

  @override
  _ComicsDescriptionState createState() => _ComicsDescriptionState();
}

class _ComicsDescriptionState extends State<ComicsDescription> {
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
              tag: widget.comics.id.toString(),
              child: Image.network(
                '${widget.comics.thumbnail.path.replaceAll('http', 'https')}.${widget.comics.thumbnail.ext}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TitleObject(title: widget.comics.title),
          widget.comics.description != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DescriptionObject(title: widget.comics.description),
                )
              : Opacity(opacity: 0.0),
          widget.comics.images.isNotEmpty
              ? Column(children: [
                  TitleCategories(title: 'Images', length: 0, index: null),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    width: screenWidth(),
                    height: getProportionateScreenHeight(250),
                    child: Center(
                      child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          itemCount: widget.comics.images.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.6,
                                  crossAxisCount: 1,
                                  mainAxisSpacing:
                                      getProportionateScreenWidth(20.0)),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      color: Colors.black38,
                                      child: PageView(
                                          children: widget.comics.images
                                              .asMap()
                                              .entries
                                              .map(
                                                (e) => Center(
                                                    child: Image(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                      '${widget.comics.images[e.key].path.replaceAll('http', 'https')}.${widget.comics.images[index].ext}'),
                                                )),
                                              )
                                              .toList()),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).backgroundColor,
                                      blurRadius: 6)
                                ]),
                                child: Image.network(
                                    '${widget.comics.images[index].path.replaceAll('http', 'https')}.${widget.comics.images[index].ext}',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fitHeight),
                              ),
                            );
                          }),
                    ),
                  ),
                ])
              : Opacity(opacity: 0.0),
          widget.comics.characters.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Characters',
                      length: widget.comics.characters.available,
                      url: widget.comics.characters.collectionUri,
                      index: 1),
                  ListCharactersDescription(character: widget.comics)
                ])
              : Opacity(opacity: 0.0),
          widget.comics.events.items.isNotEmpty
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleCategories(
                      title: 'Events',
                      length: widget.comics.events.available,
                      url: widget.comics.events.collectionUri,
                      index: 3),
                  ListEventsDescription(event: widget.comics)
                ])
              : Opacity(opacity: 0.0),
          SizedBox(height: getProportionateScreenHeight(10))
        ]))
      ],
    );
  }
}
