import 'package:flutter/material.dart';
import 'package:quality_control/routes/basic_data/menu_info_page.dart';
import 'package:quality_control/routes/basic_data/permission_info_page.dart';
import 'package:quality_control/routes/basic_data/personal_info_page.dart';
import 'package:quality_control/routes/system_setting/system_setting_page.dart';
import 'package:quality_control/widgets/menu_item.dart';

class BasicDataPage extends StatefulWidget {
  const BasicDataPage({Key? key}) : super(key: key);

  @override
  State<BasicDataPage> createState() => _BasicDataPageState();
}

class _BasicDataPageState extends State<BasicDataPage> with AutomaticKeepAliveClientMixin {
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
              _goPersonalInfoPage();
            },
          ),
          MenuItem(
            icon: Icons.accessibility,
            title: '权限信息',
            onPressed: () {
              _goPermissionInfoPage();
            },
          ),
          MenuItem(
            icon: Icons.menu_book,
            title: '菜单信息',
            onPressed: () {
              _goMenuInfoPage();
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

  ///人员信息页
  void _goPersonalInfoPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PersonalInfoPage()));
  }

  ///权限信息页
  void _goPermissionInfoPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PermissionInfoPage()));
  }

  ///菜单信息页
  void _goMenuInfoPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MenuInfoPage()));
  }

  @override
  bool get wantKeepAlive => true;
}

