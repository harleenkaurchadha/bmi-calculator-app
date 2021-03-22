import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String data;
  const IconContent({
    this.icon, this.data
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(data,
          style: kLabelTextStyle,
          ),
      ],
    );
  }
}
