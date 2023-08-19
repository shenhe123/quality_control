import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quality_control/common/global.dart';

class PermissionInfoPage extends StatefulWidget {
  const PermissionInfoPage({Key? key}) : super(key: key);

  @override
  State<PermissionInfoPage> createState() => _PermissionInfoPageState();
}

class _PermissionInfoPageState extends State<PermissionInfoPage> {

  final nameController = TextEditingController();

  final ScrollController _controller = ScrollController();
  final List<String> _data = <String>[];
  final bool _hasNext = false;
  BaseLoadingState _loadingState = BaseLoadingState.loading;

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("权限信息"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "名称",
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: _query, child: const Text('查询')),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Flex(
                direction: Axis.horizontal,
                children: const [
                  Expanded(flex: 1, child: Text("权限组编号")),
                  Expanded(flex: 1, child: Text("权限组名称")),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "备注",
                        textAlign: TextAlign.start,
                      )),
                ],
              )),
          Expanded(
            child: _loadingState == BaseLoadingState.stop
                ? ListView.separated(
              itemCount: _data.length,
              controller: _controller,
              itemBuilder: (context, index) {
                //显示item
                return _renderRow(index);
              },
              separatorBuilder: (context, index) =>
              const Divider(height: 1.0),
            )
                : const Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _retrieveData() async {
    Timer(const Duration(seconds: 1), () {
      //延时执行的代码
      setState(() {
        _loadingState = BaseLoadingState.stop;
        _data.add("1");
        _data.add("1");
        _data.add("1");
        _data.add("1");
        _data.add("1");
        _data.add("1");
      });
    });
  }

  Widget _renderRow(int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _goPermissionInfoDetailPage(_data[index]);
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(flex: 1, child: Text("$index")),
            Expanded(flex: 1, child: Text("名称$index")),
            Expanded(
                flex: 2,
                child: Text(
                  "备注$index",
                  textAlign: TextAlign.start,
                )),
          ],
        ),
      ),
    );
  }

  /// 权限信息详情
  void _goPermissionInfoDetailPage(String data) {

  }

  ///根据用户名 查询
  void _query() {}
}
