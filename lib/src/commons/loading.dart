import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marvel/src/size_config.dart';

/// Constructor del Widget de Cargando
class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rnd = Random().nextInt(3);
    return Center(
      child: Image.asset(
        'assets/gifs/load-$rnd.gif',
        width: getProportionateScreenWidth(150),
      ),
    );
  }
}
