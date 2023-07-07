import 'package:flutter/material.dart';

import 'OnsiteOptionPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> containerList = [
    const OnsiteOptionPage(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containerList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        /// 这个很重要
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '现场操作',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '出差报告',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: '系统管理',
            icon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            label: '报表',
            icon: Icon(Icons.perm_identity),
          ),
        ],
      ),
    );
  }

}
