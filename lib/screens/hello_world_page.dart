import 'package:flutter/material.dart';

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Mundo'),
      ),
      body: Center(
        child: Text(
          '¡Hola Mundo!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
