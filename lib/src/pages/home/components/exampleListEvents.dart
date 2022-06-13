import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';

import 'package:marvel/src/commons/styles.dart';
import 'package:marvel/src/services/urls.dart';
import 'package:marvel/src/models/events.dart';
import '../../../size_config.dart';

/// Contructor to the module of the events
class ExampleListEvents extends StatefulWidget {
  const ExampleListEvents({
    Key key,
  }) : super(key: key);

  @override
  _ExampleListEventsState createState() => _ExampleListEventsState();
}

class _ExampleListEventsState extends State<ExampleListEvents> {
  // Diseño
  List<ResultEvents> events = [];
  EventsModel event = new EventsModel();
  int timeStamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCategories(index: 3, title: 'Events', length: 0),
        Container(
          width: screenWidth(),
          height: getProportionateScreenHeight(370),
          child: events.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(20)),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: getProportionateScreenHeight(15)),
                  itemCount: events.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DescriptionPage(
                                      type: 2,
                                      id: events[index].id.toString(),
                                      objeto: events[index])));
                        },
                        child: ContainerEvents(type: events, index: index));
                  })
              : GestureDetector(child: Loading(), onTap: () => _getEvents()),
        )
      ],
    );
  }

  /// Metodo que recoge la lista de los events marvel
  _getEvents() async {
    final rnd = Random().nextInt(32);
    final response = await http.get(
        '${MyUrls().urlEvents}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}&offset=$rnd');

    event = EventsModel.fromMap(jsonDecode(response.body));
    for (var i = 0; i < event.data.results.length; i++) {
      if (event.data.results[i].thumbnail.path !=
          'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available') {
        events.add(event.data.results[i]);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (events.length <= 0) _getEvents();
  }
}

/// Constructor the container of the events
class ContainerEvents extends StatelessWidget {
  const ContainerEvents({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: double.infinity,
              placeholder: AssetImage('assets/gifs/load-$rnd.gif'),
              image: NetworkImage(
                '${_type[index].thumbnail.path.replaceAll('http', 'https')}.${_type[index].thumbnail.ext}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
