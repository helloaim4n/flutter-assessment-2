import 'package:flutter/material.dart';
import '../models/user.dart'; // Import your User model here
import '../services/api_service.dart'; // Import your ApiService here

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: FutureBuilder<User>(
        future: fetchUser(1), // Replace 1 with the actual userId
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text("Error fetching user information"));
            }
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${user.name}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('Username: ${user.username}'),
                  const SizedBox(height: 10),
                  Text('Email: ${user.email}'),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
