import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/cart_page.dart';
import 'package:flutter_shop/category_page.dart';
import 'package:flutter_shop/home_page.dart';
import 'package:flutter_shop/member_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(CupertinoIcons.home)
    ),
    BottomNavigationBarItem(
      title: Text('分类'),
      icon: Icon(CupertinoIcons.search)
    ),
    BottomNavigationBarItem(
      title: Text('购物车'),
      icon: Icon(CupertinoIcons.shopping_cart)
    ),
    BottomNavigationBarItem(
      title: Text('会员中心'),
      icon: Icon(CupertinoIcons.profile_circled)
    )
  ];

  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int _currentIndex = 0;
  var _currentPage;

  void _itemOnTap(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[_currentIndex];
    });
  }
  @override
  void initState() {
    super.initState();
    _currentPage = _pages[_currentIndex];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemOnTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _items,
      ),
      body: _currentPage,
    );
  }
}