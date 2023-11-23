import 'package:flutter/material.dart';
import 'package:random_team_mixer/pages/input_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Wellcome to Random Team Mixer"),
            backgroundColor: const Color.fromARGB(255, 172, 161, 63),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RandomTeamMixer()));
                  },
                  child: const Text("Let's Start"),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RandomTeamMixer()));
                  },
                  child: const Text("Let's Start"),
                ),
              ),
            ],
          )),
    );
  }
}
