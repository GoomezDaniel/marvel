import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel/src/pages/seeAll/see_all_page.dart';

import '../size_config.dart';

///  Constructor of the see all
class SeeAll extends StatelessWidget {
  const SeeAll({
    Key key,
    @required this.lenght,
  }) : super(key: key);

  final int lenght;

  @override
  Widget build(BuildContext context) {
    return Text(
      'See all ($lenght)',
      style: GoogleFonts.lato(
        color: Theme.of(context).cardColor,
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenHeight(16.0),
      ),
    );
  }
}

///  Constructor the title of the type of menu
class TitleMenu extends StatelessWidget {
  const TitleMenu({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.josefinSans(
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: getProportionateScreenHeight(25.0),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Constructor the title of menus and categories
class TitleCategories extends StatelessWidget {
  const TitleCategories({
    Key key,
    @required this.title,
    @required this.length,
    @required this.index,
    this.url,
  }) : super(key: key);

  final String title, url;
  final int length;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(20.0),
          left: getProportionateScreenWidth(20.0),
          right: getProportionateScreenWidth(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleMenu(title: title),
          length > 20
              ? GestureDetector(
                  child: SeeAll(lenght: length),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeeAllPage(
                                title: title,
                                url: url.replaceAll('http', 'https'),
                                index: index,
                              ))),
                )
              : Opacity(opacity: 0)
        ],
      ),
    );
  }
}

///  Constructor the description of the object
class DescriptionObject extends StatelessWidget {
  const DescriptionObject({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Text(
        title.replaceAll('<br>', '\n'),
        style: GoogleFonts.openSans(
          color: Theme.of(context).accentColor,
          fontSize: getProportionateScreenHeight(15.0),
        ),
      ),
    );
  }
}

///  Constructor the title of the object
class TitleObject extends StatelessWidget {
  const TitleObject({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(20.0),
        right: getProportionateScreenWidth(20.0),
        left: getProportionateScreenWidth(20.0),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.bangers(
          color: Theme.of(context).accentColor,
          letterSpacing: 2,
          fontSize: getProportionateScreenHeight(25.0),
        ),
      ),
    );
  }
}
