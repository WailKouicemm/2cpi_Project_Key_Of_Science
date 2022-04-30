import 'package:flutter/material.dart';

class Grey_text extends StatelessWidget {
  final String text;
  const Grey_text({required this.text});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "write here what you want to post",
      style: TextStyle(
          color: Colors.grey,
          fontFamily: "Montserrat"
      ),
    );
  }
}
