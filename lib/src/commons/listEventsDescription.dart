import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/models/events.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/pages/home/components/exampleListevents.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../size_config.dart';

class ListEventsDescription extends StatefulWidget {
  const ListEventsDescription({
    Key key,
    this.event,
  }) : super(key: key);
  final dynamic event;

  @override
  _ListEventsDescriptionState createState() => _ListEventsDescriptionState();
}

class _ListEventsDescriptionState extends State<ListEventsDescription> {
  List<ResultEvents> events = [];
  EventsModel _eventModel;
  int timeStamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(),
      height: getProportionateScreenHeight(180),
      child: events.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: getProportionateScreenWidth(15)),
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                                type: 2,
                                id: events[index].id.toString(),
                                objeto: events[index]))),
                    child: ContainerEvents(type: events, index: index));
              })
          : GestureDetector(child: Loading(), onTap: () => _getevents()),
    );
  }

  @override
  void initState() {
    super.initState();
    if (events.isEmpty) _getevents();
  }

  _getevents() async {
    for (var i = 0; i < widget.event.events.items.length; i++) {
      final response = await http.get(
          '${widget.event.events.items[i].resourceUri.replaceAll('http', 'https')}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}');

      setState(() {
        _eventModel = EventsModel.fromMap(jsonDecode(response.body));
        for (var i = 0; i < _eventModel.data.results.length; i++) {
          if (_eventModel.data.results[i].thumbnail.path !=
                  'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
              _eventModel.data.results[i].thumbnail.ext != 'gif') {
            events.add(_eventModel.data.results[i]);
          }
        }
      });
    }
  }
}
