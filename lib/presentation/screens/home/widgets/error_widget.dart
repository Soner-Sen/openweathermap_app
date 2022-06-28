import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: const [
        Icon(Icons.error, color: Colors.redAccent),
        Text('Something went wrong'),
      ],
    ));
  }
}
