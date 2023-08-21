import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quality_control/common/global.dart';
import 'package:quality_control/routes/travel_reports/travel_reports_detail_page.dart';


class TravelReportsPage extends StatefulWidget {
  const TravelReportsPage({Key? key}) : super(key: key);

  @override
  State<TravelReportsPage> createState() => _TravelReportsPageState();
}

class _TravelReportsPageState extends State<TravelReportsPage> with AutomaticKeepAliveClientMixin{

  final nameController = TextEditingController();

  final ScrollController _controller = ScrollController();
  final List<String> _data = <String>[];
  final bool _hasNext = true;
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
        title: const Text("出差报告"),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: (){

              },
              child: const Text(
                "打卡",
                style: TextStyle(color: Colors.white),
              )),
        ],
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
                      hintText: "用户名",
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
                  Expanded(flex: 1, child: Text("单据编号")),
                  Expanded(flex: 1, child: Text("部门")),
                  Expanded(
                      flex: 1,
                      child: Text("用户名称",)),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "用户编码",
                        textAlign: TextAlign.end,
                      )),
                ],
              )),
          Expanded(
            child: _loadingState == BaseLoadingState.stop
                ? ListView.separated(
              itemCount: _data.length,
              controller: _controller,
              itemBuilder: (context, index) {
                //如果到了表尾
                if (index == _data.length - 1) {
                  //如果还有下一页，继续获取数据
                  if (_hasNext) {
                    //获取数据
                    _retrieveData();
                    //加载时显示loading
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child:
                        CircularProgressIndicator(strokeWidth: 2.0),
                      ),
                    );
                  } else {
                    //已经加载完了，不再获取数据。
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "没有更多数据了",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                }
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
        _goTravelReportsDetailPage(_data[index]);
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(flex: 1, child: Text("编号$index")),
            Expanded(flex: 1, child: Text("部门$index")),
            Expanded(
                flex: 1,
                child: Text("用户$index",)),
            Expanded(
                flex: 1,
                child: Text(
                  "姓名$index",
                  textAlign: TextAlign.end,
                )),
          ],
        ),
      ),
    );
  }

  ///根据用户名 查询
  void _query() {}

  ///工单详情页
  void _goTravelReportsDetailPage(String data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TravelReportsDetailPage(detailData: data)));
  }

  @override
  bool get wantKeepAlive => true;
}
