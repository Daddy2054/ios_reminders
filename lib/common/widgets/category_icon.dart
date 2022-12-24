import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class CategoryIcon extends StatelessWidget {
  final dynamic bgColor;
  final IconData iconData;

  const CategoryIcon(
      {super.key, required this.bgColor, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(
        iconData,
        size: 30,
      //  color: Colors.white,
      ),
    );
  }
}
