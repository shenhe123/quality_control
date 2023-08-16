import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  const MenuItem({Key? key, required this.icon, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child:  Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 12.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                    child:Icon(
                      icon,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.black54,fontSize: 16.0),
                      )
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              )
          ),
          const Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child: Divider(
              color: Colors.black54,
            ),
          )

        ],
      ),
    );

  }
}
