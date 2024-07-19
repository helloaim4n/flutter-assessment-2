import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue.shade200,
          child: Text(
            user.name[0], // Display the first letter of the user's name
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          user.username,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
