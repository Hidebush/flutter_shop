import 'package:flutter/widgets.dart';

class HomeOperation extends StatelessWidget {
  final Map operationInfo;
  const HomeOperation({Key key, this.operationInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(operationInfo['PICTURE_ADDRESS']),
    );
  }
}