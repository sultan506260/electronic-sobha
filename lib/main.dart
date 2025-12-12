import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Account_page.dart';
import 'Search_page.dart';
import 'Setting_page.dart';
import 'home_page.dart';

void main (){
  runApp(MaterialApp
    (debugShowCheckedModeBanner: false,
      home:Index() ));
}
class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _bottomNavbar=0;
  List<Widget> _pages=[
    Homepage(),
    Searchpage(),
    Settingpage(),
    Accountpage(),

  ];
  String _gettitle(int index){
    switch (index){
      case 0:
        return 'الصفحة الرئيسية';
      case 1:
        return 'صفحة البحث';
      case 2:
        return 'صفحة الاعدادات';
      case 3:
        return 'صفحة الحساب';
      default :
        return 'data';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: Text(_gettitle(_bottomNavbar)),
        backgroundColor: Colors.grey.shade500,

      ),
      body: IndexedStack(
        index: _bottomNavbar,
        children:_pages ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavbar,
        onTap: (index){
          setState(() {
            _bottomNavbar=index;
          });
        },
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.blue[900],
        items: [
          BottomNavigationBarItem( label: 'الرئيسية', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'البحث', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'الاعدادات', icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: 'الحساب', icon: Icon(Icons.account_box)),
        ],
      ),
    );
  }
}
