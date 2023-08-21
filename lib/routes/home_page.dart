import 'package:flutter/material.dart';
import 'package:quality_control/routes/basic_data/basic_data_page.dart';
import 'package:quality_control/routes/oa/work_order_oa.dart';
import 'package:quality_control/routes/system_setting/system_setting_page.dart';
import 'package:quality_control/routes/travel_reports/travel_reports_page.dart';

import 'onsite_option/onsite_option_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _pageController;
  int selectedIndex = 0;
  List<Widget> containerList = [
    const OnsiteOptionPage(),
    const WorkOrderOA(),
    const TravelReportsPage(),
    Container(
      color: Colors.green,
    ),
    const BasicDataPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController =PageController(initialPage: selectedIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: containerList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        /// 这个很重要
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            _pageController.jumpToPage(index);
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
