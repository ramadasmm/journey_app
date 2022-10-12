import 'package:flutter/material.dart';
import 'package:journey_app/constants.dart';
import 'package:journey_app/screens/read_list_screen.dart';

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
  final fn;
  const JourneyButton({super.key, required this.label, required this.fn});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: fn,
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

class EntryTile extends StatelessWidget {
  final String title;
  final String entry;
  final String dateTime;
  const EntryTile(
      {super.key,
      required this.title,
      required this.entry,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 3,
              offset: Offset(0, 7),
            ),
          ]),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ReadListScreen(
                  title: title,
                  entry: entry,
                  date: dateTime,
                );
              },
            ),
          );
        },
        contentPadding: const EdgeInsets.all(2),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xff00114f),
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        subtitle: Text(
          entry,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Color(0xff00114f),
            fontSize: 18,
          ),
        ),
        tileColor: Colors.white,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${dateTime.substring(5, 11)},${dateTime.substring(0, 3)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff00114f),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              dateTime.substring(17).trim(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff00114f),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
