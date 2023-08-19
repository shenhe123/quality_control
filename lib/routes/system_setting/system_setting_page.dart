import 'package:flutter/material.dart';
import 'package:quality_control/widgets/menu_item.dart';

class SystemSettingPage extends StatelessWidget {
  const SystemSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("系统管理"),
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
            title: '用户管理',
            onPressed: () {
              print("用户管理  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.rule,
            title: '权限管理',
            onPressed: () {
              print("权限管理  ----   >");
            },
          ),
          MenuItem(
            icon: Icons.record_voice_over,
            title: '日志管理',
            onPressed: () {
              print("日志管理  ----   >");
            },
          ),
        ],
      ),
    );
  }
}
