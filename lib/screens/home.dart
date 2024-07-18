import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onTabSelected; // Callback to switch tabs

  const HomeScreen({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Your App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onTabSelected(1); // Switch to Posts tab
              },
              child: const Text('View Posts'),
            ),
          ],
        ),
      ),
    );
  }
}
