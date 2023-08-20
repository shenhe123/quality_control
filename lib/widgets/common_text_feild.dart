import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  ///文本输入框是否可编辑
  final bool isEnable;

  const CommonTextField(
      {Key? key,
        this.controller,
        this.isEnable = true,
      })
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,

      ///是否可编辑
      enabled: widget.isEnable,

      textAlignVertical: TextAlignVertical.center,

      ///用来配置 TextField 的样式风格
      decoration: const InputDecoration(
        ///设置输入文本框的提示文字
        ///输入框获取焦点时 并且没有输入文字时
        hintText: "请输入",

        ///设置输入文本框的提示文字的样式
        hintStyle: TextStyle(
          color: Colors.grey,
          textBaseline: TextBaseline.ideographic,
        ),

        ///取消奇怪的高度
        isCollapsed: true,
        contentPadding: EdgeInsets.all(6),//内容内边距，影响高度

        ///设置边框
        ///   InputBorder.none 无下划线
        ///   OutlineInputBorder 上下左右 都有边框
        ///   UnderlineInputBorder 只有下边框  默认使用的就是下边框
        border: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(8)),

          ///用来配置边框的样式
          borderSide: BorderSide(
            ///设置边框的颜色
            color: Colors.blue,

            ///设置边框的粗细
            width: 1.0,
          ),
        ),

        ///设置输入框可编辑时的边框样式
        enabledBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(8)),

          ///用来配置边框的样式
          borderSide: BorderSide(
            ///设置边框的颜色
            color: Colors.blue,

            ///设置边框的粗细
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(8)),

          ///用来配置边框的样式
          borderSide: BorderSide(
            ///设置边框的颜色
            color: Colors.red,

            ///设置边框的粗细
            width: 1.0,
          ),
        ),

        ///用来配置输入框获取焦点时的颜色
        focusedBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(8)),

          ///用来配置边框的样式
          borderSide: BorderSide(
            ///设置边框的颜色
            color: Colors.blue,

            ///设置边框的粗细
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
