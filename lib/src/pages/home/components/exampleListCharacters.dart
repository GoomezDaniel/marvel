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
import 'package:marvel/src/models/characters.dart';
import '../../../size_config.dart';

/// Contructor to the module of the characters
class ExampleListCharacters extends StatefulWidget {
  const ExampleListCharacters({
    Key key,
  }) : super(key: key);

  @override
  _ExampleListCharactersState createState() => _ExampleListCharactersState();
}

class _ExampleListCharactersState extends State<ExampleListCharacters> {
  /// Anuncio
  int count = 0;
  InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  // Diseño
  List<ResultCharacter> characteres = [];
  CharacterModel characters = new CharacterModel();
  int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCategories(title: 'Characters', index: 1, length: 0),
        Container(
          width: screenWidth(),
          height: getProportionateScreenHeight(180),
          child: characteres.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: getProportionateScreenWidth(15)),
                  itemCount: characteres.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          if (count >= 2 && _interstitialReady) {
                            _interstitialAd.show();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 0,
                                        id: characteres[index].id.toString(),
                                        objeto: characteres[index])));
                          } else {
                            count++;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                        type: 0,
                                        id: characteres[index].id.toString(),
                                        objeto: characteres[index])));
                          }
                        },
                        child: ContainerCharacters(
                            type: characteres, index: index));
                  })
              : GestureDetector(
                  child: Loading(), onTap: () => _getCharacters()),
        )
      ],
    );
  }

  /// Metodo que recoge la lista de los personajes marvel
  _getCharacters() async {
    final rnd = Random().nextInt(32) * Random().nextInt(32);
    final response = await http.get(
        '${MyUrls().urlCharacters}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}&offset=$rnd');

    characters = CharacterModel.fromMap(jsonDecode(response.body));
    for (var i = 0; i < characters.data.results.length; i++) {
      if (characters.data.results[i].thumbnail.path !=
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
          characters.data.results[i].thumbnail.ext != 'gif') {
        characteres.add(characters.data.results[i]);
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
    if (characteres.length <= 0) _getCharacters();
    adsLoad();
  }
}

/// Constructor the container of the characters
class ContainerCharacters extends StatelessWidget {
  const ContainerCharacters({
    Key key,
    @required List<ResultCharacter> type,
    this.index,
  })  : _type = type,
        super(key: key);

  final List<ResultCharacter> _type;
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
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: _type[index].id.toString(),
              child: FadeInImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/gifs/load-$rnd.gif'),
                image: NetworkImage(
                    '${_type[index].thumbnail.path.replaceAll('http', 'https')}.${_type[index].thumbnail.ext}'),
              ),
            ),
          ),
          Positioned(
              bottom: 0.0,
              child: Container(
                width: getProportionateScreenHeight(180),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(_type[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(12.0))),
                ),
              )),
        ]),
      ),
    );
  }
}
