import 'package:flutter/material.dart';
import 'package:esercizio_tre/widget/characters.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Icon(Icons.accessibility_new, color: Colors.blueGrey, size: 30),
              const SizedBox(width: 10),
              Text(
                "Crea personaggio",
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  color: Colors.blueGrey,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Character(ability: "Vita", initValue: 0),
          Character(ability: "Resistenza", initValue: 0),
          Character(ability: "Forza", initValue: 0),
        ],
      ),
    );
  }
}
