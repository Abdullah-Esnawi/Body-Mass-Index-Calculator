import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(15),
      // color: Color(0xFF1D1E33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: klabelTextStyle,
          )
        ],
      ),
    );
  }
}
