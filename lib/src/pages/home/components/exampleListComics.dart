import 'package:marvel/src/services/adds.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';

import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/services/urls.dart';
import 'package:marvel/src/models/comics.dart';
import '../../../size_config.dart';

/// Contructor to the module of the comics
class ExampleListComics extends StatefulWidget {
  const ExampleListComics({
    Key key,
  }) : super(key: key);

  @override
  _ExampleListComicsState createState() => _ExampleListComicsState();
}

class _ExampleListComicsState extends State<ExampleListComics> {
  /// Anuncio
  int count = 0;
  InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  // Diseño
  List<ResultComics> comics = [];
  ComicsModel comic = new ComicsModel();
  int random = (Random().nextInt(32) * Random().nextInt(32).toInt());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCategories(index: 2, title: 'Comics', length: 0),
        Container(
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
                        onTap: () {
                          if (count >= 2 && _interstitialReady) {
                            _interstitialAd.show();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 1,
                                        id: comics[index].id.toString(),
                                        objeto: comics[index])));
                          } else {
                            count++;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 1,
                                        id: comics[index].id.toString(),
                                        objeto: comics[index])));
                          }
                        },
                        child: ContainerComics(type: comics, index: index));
                  })
              : GestureDetector(child: Loading(), onTap: () => _getComics()),
        )
      ],
    );
  }

  /// Metodo que recoge la lista de los comics marvel
  _getComics() async {
    final rnd = Random().nextInt(32) * Random().nextInt(32);
    final response = await http.get(
        '${MyUrls().urlComics}?ts=$random&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$random' + MyApis().privateKey + MyApis().publicKey)).toString()}&offset=$rnd');

    comic = ComicsModel.fromMap(jsonDecode(response.body));
    for (var i = 0; i < comic.data.results.length; i++) {
      if (comic.data.results[i].thumbnail.path !=
          'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
        comics.add(comic.data.results[i]);
      }
    }

    setState(() {});
  }

  /// Método que controla los adds de la app
  void adsLoad() {
    // Carga de Publicidad
    _interstitialAd = InterstitialAd(
        adUnitId: Ads.intersticial,
        listener: (MobileAdEvent event) {
          switch (event) {
            case MobileAdEvent.loaded:
              _interstitialReady = true;
              break;
            case MobileAdEvent.failedToLoad:
              _interstitialReady = false;
              break;
            case MobileAdEvent.closed:
              count = 0;
              _interstitialAd.dispose();
              adsLoad();
              break;
            default:
          }
        });
    _interstitialAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (comics.length <= 0) _getComics();
    adsLoad();
  }
}

/// Constructor the container of the comics
class ContainerComics extends StatelessWidget {
  const ContainerComics({
    Key key,
    @required List<ResultComics> type,
    this.index,
  })  : _type = type,
        super(key: key);

  final List<ResultComics> _type;
  final int index;

  @override
  Widget build(BuildContext context) {
    int rnd = Random().nextInt(3);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).backgroundColor, blurRadius: 6)
            ]),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Hero(
              tag: _type[index].id.toString(),
              child: FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: getProportionateScreenHeight(260),
                placeholder: AssetImage('assets/gifs/load-$rnd.gif'),
                image: NetworkImage(
                  '${_type[index].thumbnail.path.replaceAll('http', 'https')}.${_type[index].thumbnail.ext}',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(_type[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(12.0))),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
