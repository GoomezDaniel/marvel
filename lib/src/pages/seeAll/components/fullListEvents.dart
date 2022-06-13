import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/models/events.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:marvel/src/services/urls.dart';

import '../../../size_config.dart';

class FullListEvents extends StatefulWidget {
  const FullListEvents({
    Key key,
    this.url,
  }) : super(key: key);

  final String url;

  @override
  _FullListEventsState createState() => _FullListEventsState();
}

class _FullListEventsState extends State<FullListEvents> {
  // List
  List<ResultEvents> resultados = [];
  EventsModel events;
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
                                    type: 2,
                                    id: resultados[index].id.toString(),
                                    objeto: resultados[index])));
                      },
                      child: ContainerEventsList(
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
        '${widget.url != null ? widget.url : MyUrls().urlEvents}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}&limit=20&offset=$offset');

    events = EventsModel.fromMap(jsonDecode(response.body));

    encontrar = true;

    for (var i = 0; i < events.data.results.length; i++) {
      encontrar = true;
      for (var o = 0; o < resultados.length; o++) {
        if (resultados[o].id == events.data.results[i].id) {
          encontrar = false;
          break;
        }
      }
      if (events.data.results[i].thumbnail.path ==
          'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
        nulos++;
      }
      if (encontrar &&
          resultados.length < events.data.total - nulos &&
          events.data.results[i].thumbnail.path !=
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
        resultados.add(events.data.results[i]);
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
        if (resultados.length < events.data.total - nulos) {
          fetchData();
        }
      }
    });
  }
}

/// Constructor the container of the events
class ContainerEventsList extends StatelessWidget {
  const ContainerEventsList({
    Key key,
    @required List<ResultEvents> type,
    this.index,
  })  : _type = type,
        super(key: key);

  final List<ResultEvents> _type;
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
      child: ClipRRect(
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
    );
  }
}
