import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
<<<<<<< HEAD
      color: Color.fromARGB(255, 193, 194, 194),
=======
      color: Color.fromARGB(255, 33, 129, 231),
>>>>>>> 03ff2b722f11f78fea4901be562601683ed20887
      child: Text(text),
    );
  }
}
