import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quality_control/routes/onsite_option/onsite_option_detail_page.dart';

import '../../common/global.dart';

class OnsiteOptionPage extends StatefulWidget {
  const OnsiteOptionPage({Key? key}) : super(key: key);

  @override
  State<OnsiteOptionPage> createState() => _OnsiteOptionPageState();
}

class _OnsiteOptionPageState extends State<OnsiteOptionPage>
    with AutomaticKeepAliveClientMixin {
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
        title: Row(
          children: [
            Expanded(
                child: Container(
              height: 40,
              alignment: Alignment.center,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "搜索",
                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
              ),
            )),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: _query,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35))),
                ),
                child: const Text('查询')),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _loadingState == BaseLoadingState.stop
                ? ListView.builder(
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
        _goOnsiteOptionDetailPage(_data[index]);
      },
      child: Card(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("申请人: shenhe"), Text("申请部门: 销售部")],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("申请工厂: 工厂A"),
                    Text("申请日期: ${Global.dateFormat2.format(DateTime.now())}")
                  ],
                ),
              ],
            ),
          )),
    );
  }

  ///根据用户名 查询
  void _query() {}

  ///工单详情页
  void _goOnsiteOptionDetailPage(String data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OnsiteOptionDetailPage(detailData: data)));
  }

  @override
  bool get wantKeepAlive => true;
}
