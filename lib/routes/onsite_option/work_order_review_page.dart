import 'package:flutter/material.dart';

class WorkOrderReviewPage extends StatefulWidget {
  const WorkOrderReviewPage({Key? key, required String detailData}) : super(key: key);

  @override
  State<WorkOrderReviewPage> createState() => _WorkOrderReviewPageState();
}

class _WorkOrderReviewPageState extends State<WorkOrderReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("审核工单"),
          backgroundColor: Colors.blue,
        ),
        body: Container());
  }
}
