import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: Center(
        child: Container(
          child: Text('会员中心'),
        )
      ),
    );
  }
}