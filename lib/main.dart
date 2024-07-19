import 'package:assessment_2_app/providers/app_state.dart';
import 'package:assessment_2_app/screens/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/favorite.dart';
import 'screens/home.dart';
import 'screens/user_profile.dart';
import 'utils/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(builder: (context, appState, _) {
        return MaterialApp(
            title: 'Flutter App',
            theme: AppTheme.lightTheme, // Apply the theme here
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/posts': (context) => const PostsList(),
              '/favorites': (context) => const FavoriteScreen(),
              '/profile': (context) => const UserProfileScreen(),
            });
      })));
}
