import 'package:flutter/material.dart';

class RandomTeamMixer extends StatefulWidget {
  const RandomTeamMixer({super.key});

  @override
  State<RandomTeamMixer> createState() => _RandomTeamMixerState();
}

class _RandomTeamMixerState extends State<RandomTeamMixer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random Team Mixer"),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
