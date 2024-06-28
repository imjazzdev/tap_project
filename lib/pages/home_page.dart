import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, prefer_typing_uninitialized_variables
    var headline4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
