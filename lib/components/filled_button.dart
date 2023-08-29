import 'package:beepo/utils/styles.dart';
import 'package:flutter/material.dart';

class FilledButtons extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? color;

  const FilledButtons(
      {Key? key, required this.text, this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 237,
      height: 42,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color ?? secondaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
