import 'package:flutter/widgets.dart';

class HomeAd extends StatelessWidget {
  final String imageStr;
  const HomeAd(this.imageStr, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageStr);
  }
}