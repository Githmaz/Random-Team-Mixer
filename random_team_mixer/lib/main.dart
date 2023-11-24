import 'package:flutter/material.dart';
import 'package:random_team_mixer/pages/group_overview_page.dart';
import 'package:random_team_mixer/pages/home_page.dart';
import 'package:random_team_mixer/pages/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/inputPage': (context) => const InputPage(),
        '/groupOverview': (context) => GroupOverView(
              nameList: (ModalRoute.of(context)!.settings.arguments
                      as Map<String, dynamic>?)?['nameList'] ??
                  [],
            ),
      },
    );
  }
}
