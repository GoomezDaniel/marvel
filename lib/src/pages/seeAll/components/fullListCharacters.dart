import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/models/characters.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:marvel/src/services/urls.dart';

import '../../../size_config.dart';

class FullListCharacters extends StatefulWidget {
  const FullListCharacters({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _FullListCharactersState createState() => _FullListCharactersState();
}

class _FullListCharactersState extends State<FullListCharacters> {
  // List
  List<ResultCharacter> resultados = [];
  CharacterModel characters;
  int timeStamp = DateTime.now().microsecondsSinceEpoch;

  /// Diseño
  ScrollController _scrollController = new ScrollController();
  int offset = 0;
  bool encontrar = true;
  bool _isLoading = false;
  int nulos = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(),
        height: screenHeight(),
        child: resultados.isNotEmpty
            ? Stack(children: [
                GridView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(20),
                      vertical: 15.0),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: getProportionateScreenWidth(15),
                      mainAxisSpacing: getProportionateScreenHeight(20)),
                  itemCount: resultados.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionPage(
                                    type: 0,
                                    id: resultados[index].id.toString(),
                                    objeto: resultados[index])));
                      },
                      child: ContainerCharactersList(
                        type: resultados,
                        index: index,
                      ),
                    );
                  },
                ),
                _isLoading
                    ? InkWell(
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black.withOpacity(0.5),
                            child: Loading()),
                        onTap: () {
                          setState(() {
                            _isLoading = false;
                          });
                        })
                    : Opacity(opacity: 0)
              ])
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Loading()));
  }

  /// Metodo que recoge la lista de los personajes marvel
  _getList() async {
    final response = await http.get(
        '${widget.url != null ? widget.url : MyUrls().urlCharacters}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}&limit=20&offset=$offset');

    characters = CharacterModel.fromMap(jsonDecode(response.body));

    encontrar = true;

    for (var i = 0; i < characters.data.results.length; i++) {
      encontrar = true;
      for (var o = 0; o < resultados.length; o++) {
        if (resultados[o].id == characters.data.results[i].id) {
          encontrar = false;
          break;
        }
      }
      if (characters.data.results[i].thumbnail.path ==
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
          characters.data.results[i].thumbnail.ext == 'gif') {
        nulos++;
      }
      if (encontrar &&
          resultados.length < characters.data.total - nulos &&
          characters.data.results[i].thumbnail.path !=
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
          characters.data.results[i].thumbnail.ext != 'gif') {
        resultados.add(characters.data.results[i]);
      }
    }

    offset += 20;

    setState(() {});
  }

  /// Metodo que carga sus respuestas una vez se han cargado los dato
  /// y se solicitan más
  Future fetchData() async {
    _isLoading = true;

    setState(() {});

    return respuestaHTTP();
  }

  /// Metodo que comprueba la respuesta del scroll
  respuestaHTTP() async {
    await _getList();

    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 150,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  @override
  void initState() {
    super.initState();
    if (resultados.length <= 0) _getList();

    // Controlador del scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (resultados.length < characters.data.total - nulos) {
          fetchData();
        }
      }
    });
  }
}

/// Constructor the container of the characters
class ContainerCharactersList extends StatelessWidget {
  const ContainerCharactersList({
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
    return Container(
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
                '${_type[index].thumbnail.path.replaceAll('http', 'https')}.${_type[index].thumbnail.ext}',
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0.0,
            child: Container(
              width: (screenWidth() / 2) - getProportionateScreenHeight(28),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(_type[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold)),
              ),
            )),
      ]),
    );
  }
}
