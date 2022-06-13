import 'package:marvel/src/models/comics.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/pages/home/components/exampleListComics.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../size_config.dart';
import 'loading.dart';

class ListComicsDescription extends StatefulWidget {
  const ListComicsDescription({
    Key key,
    this.comic,
  }) : super(key: key);
  final dynamic comic;

  @override
  _ListComicsDescriptionState createState() => _ListComicsDescriptionState();
}

class _ListComicsDescriptionState extends State<ListComicsDescription> {
  List<ResultComics> comics = [];
  ComicsModel _comicModel;
  int timeStamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(),
      height: getProportionateScreenHeight(330),
      child: comics.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 1,
                  mainAxisSpacing: getProportionateScreenWidth(15)),
              itemCount: comics.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                                type: 1,
                                id: comics[index].id.toString(),
                                objeto: comics[index]))),
                    child: ContainerComics(type: comics, index: index));
              })
          : GestureDetector(child: Loading(), onTap: () => _getcomics()),
    );
  }

  @override
  void initState() {
    super.initState();
    if (comics.isEmpty) _getcomics();
  }

  _getcomics() async {
    for (var i = 0; i < widget.comic.comics.items.length; i++) {
      final response = await http.get(
          '${widget.comic.comics.items[i].resourceUri.replaceAll('http', 'https')}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}');

      setState(() {
        _comicModel = ComicsModel.fromMap(jsonDecode(response.body));
        for (var i = 0; i < _comicModel.data.results.length; i++) {
          if (_comicModel.data.results[i].thumbnail.path !=
                  'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
              _comicModel.data.results[i].thumbnail.ext != 'gif') {
            comics.add(_comicModel.data.results[i]);
          }
        }
      });
    }
  }
}
