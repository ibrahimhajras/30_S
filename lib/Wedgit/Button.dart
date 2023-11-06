import 'package:challenge_30_seconds/Data/staticColors.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  String buttonText;
  GestureTapCallback onTap;

  customButton({
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
        horizontal: 15),
    height: 50,
    width: MediaQuery.sizeOf(context).width*0.75,
    color: StaticColors.Pink,
    child: MaterialButton(
      onPressed:onTap,
      child: Text(
        buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
    ),
    );
  }
}
