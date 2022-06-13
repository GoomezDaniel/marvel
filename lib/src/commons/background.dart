import 'package:flutter/material.dart';

import '../size_config.dart';

class Background extends StatelessWidget {
  const Background({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
      color: Colors.black.withOpacity(0.75),
    );
  }
}

class BackgroundNetwork extends StatelessWidget {
  const BackgroundNetwork({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
      color: Colors.black.withOpacity(0.8),
    );
  }
}
