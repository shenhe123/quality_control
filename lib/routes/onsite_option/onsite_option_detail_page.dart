import 'package:flutter/material.dart';
import 'package:quality_control/common/global.dart';
import 'package:quality_control/routes/onsite_option/work_order_review_page.dart';

import 'order_create_page.dart';

class OnsiteOptionDetailPage extends StatefulWidget {
  final String detailData;

  const OnsiteOptionDetailPage({Key? key, required this.detailData})
      : super(key: key);

  @override
  State<OnsiteOptionDetailPage> createState() => _OnsiteOptionDetailPageState();
}

class _OnsiteOptionDetailPageState extends State<OnsiteOptionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("工单处理"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Card(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "申请人信息：",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("申请人: shenhe"),
                          Text("申请部门: 销售部")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("申请工厂: 工厂A"),
                          Text(
                              "申请日期: ${Global.dateFormat2.format(DateTime.now())}")
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "服务信息：",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("服务客户名称: SSS"),
                          Text("服务人员名称: AAA")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("联系方式: 123222222222"),
                          Text("排查数量: 10")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("服务单价: 123222222222"),
                          Text("预估服务周期: 10")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("预估总费用: 1234"),
                          Text("服务地点: 北京市四季青")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("服务内容描述: "),
                          Expanded(child: TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
                                border: OutlineInputBorder()),
                          ),)

                        ],
                      ),
                    ],
                  ),
                )),
            const Expanded(child: Text("")),

            Padding(padding: EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: _orderCreate, child: const Text('去排查')),
            ),)

          ],
        ));
  }

  /// 工单录入
  void _orderCreate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OrderCreatePage(detailData: widget.detailData)));
  }
}
