import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Container> containerList = [
    Container(
      color: Colors.red,
    ),
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text("质量管理系统"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: _goToProfile, icon: const Icon(Icons.account_circle))
        ],
      ),
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
            label: 'F1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'F2',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'F3',
            icon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            label: 'F4',
            icon: Icon(Icons.perm_identity),
          ),
        ],
      ),
    );
  }

  /// 个人中心 基础资料页
  void _goToProfile() {
  }
}
