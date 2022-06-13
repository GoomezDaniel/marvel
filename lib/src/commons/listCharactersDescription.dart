import 'package:marvel/src/models/characters.dart';
import 'package:marvel/src/pages/description/description_page.dart';
import 'package:marvel/src/pages/home/components/exampleListCharacters.dart';
import 'package:marvel/src/services/myApis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../size_config.dart';
import 'loading.dart';

class ListCharactersDescription extends StatefulWidget {
  const ListCharactersDescription({
    Key key,
    this.character,
  }) : super(key: key);
  final dynamic character;

  @override
  _ListCharactersDescriptionState createState() =>
      _ListCharactersDescriptionState();
}

class _ListCharactersDescriptionState extends State<ListCharactersDescription> {
  List<ResultCharacter> characters = [];
  CharacterModel _characterModel;
  int timeStamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(),
      height: getProportionateScreenHeight(180),
      child: characters.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: getProportionateScreenWidth(15)),
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                                type: 0,
                                id: characters[index].id.toString(),
                                objeto: characters[index]))),
                    child: ContainerCharacters(type: characters, index: index));
              })
          : GestureDetector(child: Loading(), onTap: () => _getCharacters()),
    );
  }

  @override
  void initState() {
    super.initState();
    if (characters.isEmpty) _getCharacters();
  }

  _getCharacters() async {
    for (var i = 0; i < widget.character.characters.items.length; i++) {
      final response = await http.get(
          '${widget.character.characters.items[i].resourceUri.replaceAll('http', 'https')}?ts=$timeStamp&apikey=${MyApis().publicKey}&hash=${md5.convert(utf8.encode('$timeStamp' + MyApis().privateKey + MyApis().publicKey)).toString()}');

      setState(() {
        _characterModel = CharacterModel.fromMap(jsonDecode(response.body));
        for (var i = 0; i < _characterModel.data.results.length; i++) {
          if (_characterModel.data.results[i].thumbnail.path !=
                  'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available' &&
              _characterModel.data.results[i].thumbnail.ext != 'gif') {
            characters.add(_characterModel.data.results[i]);
          }
        }
      });
    }
  }
}
