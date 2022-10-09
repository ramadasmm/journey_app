import 'package:flutter/material.dart';
import 'package:journey_app/constants.dart';

class JourneyTitle extends StatelessWidget {
  const JourneyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Journey',
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = const Color(0xff00114f),
          ),
        ),
        const Text(
          'Journey',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class JourneyButton extends StatelessWidget {
  final String label;
  final Function fn;
  const JourneyButton({super.key, required this.label, required this.fn});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        fn;
      },
      child: Container(
        width: w * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(width: 3, color: Colors.white),
        ),
        child: Center(
            child: Text(
          label,
          style: kButtonText,
        )),
      ),
    );
  }
}
