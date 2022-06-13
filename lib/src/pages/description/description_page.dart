import 'package:flutter/material.dart';
import 'package:marvel/src/commons/background.dart';
import 'package:marvel/src/pages/description/components/charactersDescription.dart';

import 'components/comicsDescription.dart';
import 'components/eventsDescription.dart';
import 'components/seriesDescription.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    Key key,
    this.id,
    this.objeto,
    this.type,
  }) : super(key: key);

  final String id;
  final int type;
  final dynamic objeto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundNetwork(
            image:
                '${objeto.thumbnail.path.replaceAll('http', 'https')}.${objeto.thumbnail.ext}'),
        selectType()
      ]),
    );
  }

  selectType() {
    switch (type) {
      case 0:
        return CharactersDescription(character: objeto);
        break;
      case 1:
        return ComicsDescription(comics: objeto);
        break;
      case 2:
        return EventsDescription(events: objeto);
        break;
      case 3:
        return SeriesDescription(series: objeto);
        break;
    }
  }
}
