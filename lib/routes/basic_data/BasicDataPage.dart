import 'package:flutter/material.dart';
import 'package:quality_control/routes/system_setting/SystemSettingPage.dart';
import 'package:quality_control/widgets/MenuItem.dart';

class BasicDataPage extends StatefulWidget {
  const BasicDataPage({Key? key}) : super(key: key);

  @override
  State<BasicDataPage> createState() => _BasicDataPageState();
}

class _BasicDataPageState extends State<BasicDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("基础数据"),
        backgroundColor: Colors.blue,
        actions: [
          // TextButton(
          //     onPressed: () {},
          //     child: const Text(
          //       "工单录入",
          //       style: TextStyle(color: Colors.white),
          //     )),
        ],
      ),
      body: Column(
        children: [
          MenuItem(
            icon: Icons.person,
            title: '人员信息',
            onPressed: () {
              print("人员信息  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.accessibility,
            title: '角色信息',
            onPressed: () {
              print("角色信息  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.menu_book,
            title: '菜单信息',
            onPressed: () {
              print("菜单信息  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.record_voice_over,
            title: '操作日志',
            onPressed: () {
              print("操作日志  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.settings,
            title: '系统管理',
            onPressed: () {
              _goSystemSettingPage();
            },
          ),
        ],
      ),
    );
  }

  ///工单详情页
  void _goSystemSettingPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SystemSettingPage()));
  }
}

