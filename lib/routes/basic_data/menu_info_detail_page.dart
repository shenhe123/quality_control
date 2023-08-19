import 'package:flutter/material.dart';

class MenuInfoDetailPage extends StatefulWidget {
  const MenuInfoDetailPage({Key? key}) : super(key: key);

  @override
  State<MenuInfoDetailPage> createState() => _MenuInfoDetailPageState();
}

class _MenuInfoDetailPageState extends State<MenuInfoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("菜单信息详情"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("编号："),
                  Text(
                    "001",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("名称："),
                  Text(
                    "shenhe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("是否可用："),
                  Text(
                    "001",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("备注："),
                  Text(
                    "001",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const FlutterLogo(size: 130),
            ],
          ),
        ));
  }
}
