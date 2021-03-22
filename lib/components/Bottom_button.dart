import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  BottomButton({@required this.label,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kbottomBarHeight,
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
