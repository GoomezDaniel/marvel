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
import 'package:marvel/src/models/series.dart';
import '../../../size_config.dart';

/// Contructor to the module of the series
class ExampleListSeries extends StatefulWidget {
  const ExampleListSeries({
    Key key,
  }) : super(key: key);

  @override
  _ExampleListSeriesState createState() => _ExampleListSeriesState();
}

class _ExampleListSeriesState extends State<ExampleListSeries> {
  /// Anuncio
  int count = 0;
  InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  // Diseño
  List<ResultSeries> series = [];
  SeriesModel serie = new SeriesModel();
  int timeStamp = new DateTime.now().microsecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCategories(index: 4, title: 'Series', length: 0),
        Container(
          width: screenWidth(),
          height: getProportionateScreenHeight(280),
          child: series.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(20)),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.7,
                      crossAxisCount: 1,
                      mainAxisSpacing: getProportionateScreenWidth(15)),
                  itemCount: series.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          if (count >= 2 && _interstitialReady) {
                            _interstitialAd.show();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 3,
                                        id: series[index].id.toString(),
                                        objeto: series[index])));
                          } else {
                            count++;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 3,
                                        id: series[index].id.toString(),
                                        objeto: series[index])));
                          }
                        },
                        child: ContainerSeries(type: series, index: index));
                  })
              : GestureDetector(child: Loading(), onTap: () => _getSeries()),
        )
      ],
    );
  }

  /// Metodo que recoge la lista de los series marvel
  _getSeries() async {
    int rnd = Random().nextInt(32);
    final response = await http.get(
        '${MyUrls().urlSeries}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}&offset=$rnd');

    serie = SeriesModel.fromMap(jsonDecode(response.body));
    for (var i = 0; i < serie.data.results.length; i++) {
      if (serie.data.results[i].thumbnail.path !=
          'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
        series.add(serie.data.results[i]);
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
    if (series.length <= 0) _getSeries();
    adsLoad();
  }
}

/// Constructor the container of the series
class ContainerSeries extends StatelessWidget {
  const ContainerSeries({
    Key key,
    @required List<ResultSeries> type,
    this.index,
  })  : _type = type,
        super(key: key);

  final List<ResultSeries> _type;
  final int index;

  @override
  Widget build(BuildContext context) {
    int rnd = Random().nextInt(3);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).backgroundColor, blurRadius: 6)
            ]),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: _type[index].id.toString(),
              child: FadeInImage(
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: double.infinity,
                placeholder: AssetImage('assets/gifs/load-$rnd.gif'),
                image: NetworkImage(
                    '${_type[index].thumbnail.path.replaceAll('http', 'https')}/portrait_uncanny.${_type[index].thumbnail.ext}'),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: getProportionateScreenHeight(280) / 1.7,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: Center(
                child: Text(_type[index].title,
                    overflow: TextOverflow.ellipsis,
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
