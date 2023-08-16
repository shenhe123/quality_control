import 'package:flutter/material.dart';
import 'package:quality_control/routes/basic_data/BasicDataPage.dart';
import 'package:quality_control/routes/system_setting/SystemSettingPage.dart';

import 'onsite_option/OnsiteOptionPage.dart';


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
    ),
    const BasicDataPage(),
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
            label: 'OA',
            icon: Icon(Icons.account_tree_outlined),
          ),
          BottomNavigationBarItem(
            label: '出差报告',
            icon: Icon(Icons.card_travel_sharp),
          ),
          BottomNavigationBarItem(
            label: '报表',
            icon: Icon(Icons.table_view),
          ),
          BottomNavigationBarItem(
            label: '基础数据',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

}
