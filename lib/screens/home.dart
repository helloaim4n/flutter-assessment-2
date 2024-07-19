import 'package:flutter/material.dart';
import 'package:assessment_2_app/screens/favorite.dart';
import 'package:assessment_2_app/screens/posts_list.dart';
import '../widgets/featured_card.dart';
import 'user_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const PostsList(),
    const FavoriteScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Post App!',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is a simple app that displays a list of posts. You can view the details of each post, mark them as favorites, and search for posts.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/posts');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.article, size: 20),
              label:
                  const Text('Explore Posts', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FeatureCard(
                  icon: Icons.favorite,
                  title: 'Mark Favorites',
                  description: 'Save your favorite posts for later.',
                  route: '/favorites',
                ),
                FeatureCard(
                  icon: Icons.person,
                  title: 'User Profile',
                  description: 'Customize your profile settings.',
                  route: '/profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
