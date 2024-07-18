import 'package:assessment_2_app/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Flutter App',
        theme: AppTheme.lightTheme, // Apply the theme here
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
