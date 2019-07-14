import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBanner extends StatelessWidget {
  final List<Map> swiperList;
  const HomeBanner(this.swiperList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: swiperList.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          swiperList[index]['image'],
          fit: BoxFit.cover,
        );
      },
      // control: SwiperControl(),
      pagination: SwiperPagination(),
    );
  }
}