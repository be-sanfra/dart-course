import 'package:esercizio_tre/widget/button_model.dart';
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  final String ability;
  final int initValue;

  const Character({required this.ability, required this.initValue});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  void incrementValue() {
    setState(() {
      switch (widget.ability) {
        case "Vita":
          if (_value < 10) _value++;
          break;
        case "Resistenza":
          if (_value < 3) _value++;
          break;
        case "Forza":
          if (_value < 6) _value++;
          break;
      }
    });
  }

  void decrementValue() {
    setState(() {
      if (_value > 0) _value--;
    });
  }

  Color getColor() => (widget.ability == "Vita")
      ? Colors.redAccent
      : widget.ability == "Resistenza"
      ? Colors.pink
      : widget.ability == "Forza"
      ? Colors.indigo
      : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                textAlign: TextAlign.center,
                _value.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: getColor(),
                  fontFamily: 'PressStart2P',
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Text(
                widget.ability,
                style: TextStyle(fontSize: 17, fontFamily: 'PressStart2P'),
              ),
            ),

            ButtonModel(buttonText: "-", onPressed: decrementValue),

            ButtonModel(buttonText: "+", onPressed: incrementValue),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 2),
      ],
    );
  }
}
