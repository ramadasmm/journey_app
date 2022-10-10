import 'package:flutter/material.dart';
import 'package:journey_app/components.dart';
import 'package:journey_app/constants.dart';
import 'package:journey_app/screens/add_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: h,
          width: w,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JourneyTitle(),
              SizedBox(
                height: h * 0.045,
              ),
              Image(
                image: const AssetImage('images/journal.png'),
                width: w * 0.51,
                height: h * 0.23,
              ),
              SizedBox(
                height: h * 0.08,
              ),
              JourneyButton(label: 'Read Entries', fn: () {}),
              SizedBox(
                height: h * 0.05,
              ),
              JourneyButton(
                  label: 'Add Entry',
                  fn: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEntryScreen(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
