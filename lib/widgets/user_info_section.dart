import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfoSection extends StatelessWidget {
  final User user;

  const UserInfoSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildListTile(Icons.email, 'Email', user.email),
            _buildListTile(Icons.phone, 'Phone', user.phone),
            _buildListTile(Icons.web, 'Website', user.website),
            _buildListTile(
              Icons.location_city,
              'Address',
              '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}',
            ),
            _buildListTile(
              Icons.business,
              'Company',
              '${user.company.name}, ${user.company.catchPhrase}, ${user.company.bs}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}
