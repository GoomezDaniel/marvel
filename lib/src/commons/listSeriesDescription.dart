import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/src/commons/loading.dart';
import 'package:marvel/src/models/series.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/pages/home/components/exampleListSeries.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../size_config.dart';

class ListSeriesDescription extends StatefulWidget {
  const ListSeriesDescription({
    Key key,
    this.serie,
    this.id,
  }) : super(key: key);
  final dynamic serie;
  final int id;

  @override
  _ListSeriesDescriptionState createState() => _ListSeriesDescriptionState();
}

class _ListSeriesDescriptionState extends State<ListSeriesDescription> {
  List<ResultSeries> series = [];
  SeriesModel _serieModel;
  int timeStamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(),
      height: getProportionateScreenHeight(280),
      child: series.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.7,
                  crossAxisCount: 1,
                  mainAxisSpacing: getProportionateScreenWidth(15)),
              itemCount: series.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                                type: 3,
                                id: series[index].id.toString(),
                                objeto: series[index]))),
                    child: ContainerSeries(type: series, index: index));
              })
          : GestureDetector(child: Loading(), onTap: () => _getSeries()),
    );
  }

  @override
  void initState() {
    super.initState();
    if (series.isEmpty && widget.id == null) {
      _getSeries();
    } else {
      _getSerie();
    }
  }

  _getSerie() async {
    final response = await http.get(
        '${widget.serie.series.resourceUri.replaceAll('http', 'https')}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}');

    setState(() {
      _serieModel = SeriesModel.fromMap(jsonDecode(response.body));
      if (_serieModel.data.results[0].thumbnail.path !=
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
          _serieModel.data.results[0].thumbnail.ext != 'gif') {
        series.add(_serieModel.data.results[0]);
      }
    });
  }

  _getSeries() async {
    for (var i = 0; i < widget.serie.series.items.length; i++) {
      final response = await http.get(
          '${widget.serie.series.items[i].resourceUri.replaceAll('http', 'https')}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}');

      setState(() {
        _serieModel = SeriesModel.fromMap(jsonDecode(response.body));
        for (var i = 0; i < _serieModel.data.results.length; i++) {
          if (_serieModel.data.results[i].thumbnail.path !=
                  'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
              _serieModel.data.results[i].thumbnail.ext != 'gif') {
            series.add(_serieModel.data.results[i]);
          }
        }
      });
    }
  }
}
