import 'package:flutter/material.dart';

import '../components.dart';
import '../constants.dart';

class ReadListScreen extends StatelessWidget {
  final String title;
  final String entry;
  final String date;

  const ReadListScreen(
      {super.key,
      required this.title,
      required this.entry,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: kScreenBg,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const JourneyTitle(),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 12, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${date.substring(5, 17).trim()}\n${date.substring(0, 5).trim()}${date.substring(17)}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 3,
                        height: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              entry,
                              maxLines: 50,
                              softWrap: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              JourneyButton(
                  label: 'BACK',
                  fn: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
