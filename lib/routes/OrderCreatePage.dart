import 'package:flutter/material.dart';

import '../common/Global.dart';

class OrderCreatePage extends StatefulWidget {
  final String detailData;

  const OrderCreatePage({Key? key, required this.detailData}) : super(key: key);

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends State<OrderCreatePage> {

  int sex = 1;
  int orderStatus = 1;
  final checkNumController = TextEditingController(text: "10");


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    checkNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("质量管理系统"),
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
                onPressed: () => _orderReview(),
                child: const Text("审核", style: TextStyle(color: Colors.white))),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: const [
                    RedStarText(),
                    Text("服务地点："),
                    Text("北京市昌平区回龙观西大街119号", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const RedStarText(),
                    const Text("不   良   图  片："),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const RedStarText(),
                    const Text("外箱标签图片："),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const RedStarText(),
                    const Text("批次信息图片："),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("排查日期："),
                    Text(Global.dateFormat.format(DateTime.now()), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: const [
                    Text("排查数量："),
                    Text("10", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: const [
                    Text("不良数量："),
                    Text("8", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const RedStarText(),
                    const Text("返工数量图片："),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                    const SizedBox(width: 10,),
                    Container(width: 60, height:60, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("工厂CQE工程师："),
                    Radio(
                      // 按钮的值
                      value: 1,
                      // 改变事件
                      onChanged: (value){
                        setState(() {
                          sex = value ?? 0;
                        });
                      },
                      // 按钮组的值
                      groupValue:sex ,
                    ),

                    const Text("同意"),

                    const SizedBox(width: 10,),
                    Radio(
                      value:2,
                      onChanged: (value){
                        setState(() {
                          sex = value ?? 0;
                        });
                      },
                      groupValue: sex,
                    ),
                    const Text("不同意"),
                  ],
                ),


                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("排查数量总（至今）："),
                    Expanded(
                      child: TextField(
                        controller: checkNumController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("不良数量总（至今）："),
                    Expanded(
                      child: TextField(
                        controller: checkNumController,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("工单状态："),
                    Radio(
                      // 按钮的值
                      value: 1,
                      // 改变事件
                      onChanged: (value){
                        setState(() {
                          orderStatus = value ?? 0;
                        });
                      },
                      // 按钮组的值
                      groupValue:orderStatus ,
                    ),

                    const Text("已完结"),

                    const SizedBox(width: 10,),
                    Radio(
                      value:2,
                      onChanged: (value){
                        setState(() {
                          orderStatus = value ?? 0;
                        });
                      },
                      groupValue: orderStatus,
                    ),
                    const Text("未完结"),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  /// 工单审核
  void _orderReview() {}
}

class RedStarText extends StatelessWidget {
  const RedStarText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("*", style: TextStyle(color: Colors.red));
  }
}
