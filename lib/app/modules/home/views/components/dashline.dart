import 'package:flutter/material.dart';


class DashedLine extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashWidth;
  final Color color;

  const DashedLine({
    Key? key,
    required this.height,
    this.dashHeight = 5,
    this.dashWidth = 2,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double dashCount = (constraints.maxHeight / (2 * dashHeight)).floorToDouble();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount.toInt(), (_) {
              return Container(
                width: dashWidth,
                height: dashHeight,
                color: color,
              );
            }),
          );
        },
      ),
    );
  }
}