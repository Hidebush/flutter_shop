import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeLeaderPhone extends StatelessWidget {
  final String phoneNum;
  final String backImageName;
  const HomeLeaderPhone(this.phoneNum, this.backImageName, {Key key}) : super(key: key);

  _callPhone() async {
    if (phoneNum.isNotEmpty) {
      var phone = 'tel:$phoneNum';
      if (await canLaunch(phone)) {
        await launch(phone);
      } else {
        throw 'could not launch $phone';
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          // print('拨打电话$phoneNum');
          _callPhone();
        },
        child: Image.network(backImageName),
      ),
    );
  }
}