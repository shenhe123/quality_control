import 'package:flutter/material.dart';

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
          title: const Text("质量管理系统"),
          leading: TextButton(
              onPressed: _orderReview,
              child: const Text("审核", style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
                onPressed: _orderCreate,
                child: const Text(
                  "工单录入",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("工单编码："),
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
                  Text("申请人："),
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
                  Text("申请日期："),
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
                  Text("申请部门："),
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
                  Text("申请工厂："),
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
                  Text("服务客户名称："),
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
                  Text("服务人员名称："),
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
                  Text("联系方式："),
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
                  Text("排查数量："),
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
                  Text("服务单价："),
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
                  Text("预付服务周期："),
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
                  Text("预估总费用："),
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
                  Text("服务地点："),
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
                  Text("服务内容描述："),
                  Text(
                    "001",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  /// 工单审核
  void _orderReview() {}

  /// 工单录入
  void _orderCreate() {}
}
