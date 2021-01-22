import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

/*
 * Nao funciona a animacao de quando ganha. Por enquanto...
 */
class WinnerAnimation extends StatefulWidget {
  @override
  _WinnerAnimationState createState() => _WinnerAnimationState();
}

class _WinnerAnimationState extends State<WinnerAnimation> {
  @override
  Widget build(BuildContext context) {
    bool isPaused = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => isPaused = true),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: new FlareActor(
            "assets/Fireworks_red2.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "activate",
            isPaused: isPaused,
          ),
        ),
      ),
    );
  }
}
