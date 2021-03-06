import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloor extends StatelessWidget {
  final String headerImageName;
  final List<Map> floorContent;
  const HomeFloor({Key key, this.headerImageName, this.floorContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FloorHeader(headerImageName),
          FloorContent(contentData: floorContent)
        ],
      ),
    );
  }
}

class FloorHeader extends StatelessWidget {
  final String imageName;
  const FloorHeader(this.imageName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: FloorItem(imageName: imageName),
    );
  }
}

class FloorContent extends StatelessWidget {
  final List<Map> contentData;
  const FloorContent({Key key, this.contentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.screenWidthDp * 0.5,
            child: Row(children: <Widget>[
              Expanded(
                child: FloorItem(
                  imageName: contentData[0]['image'],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: FloorItem(
                        imageName: contentData[1]['image'],
                      ),
                    ),
                    Expanded(
                      child: FloorItem(
                        imageName: contentData[2]['image'],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Container(
            height: ScreenUtil.screenWidthDp * 0.5 * 0.5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FloorItem(
                    imageName: contentData[3]['image'],
                  ),
                ),
                Expanded(
                  child: FloorItem(
                    imageName: contentData[4]['image'],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FloorItem extends StatelessWidget {
  final String imageName;
  const FloorItem({Key key, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print('点击了。。');
        },
        child: Image.network(imageName, fit: BoxFit.cover),
      ),
    );
  }
}
