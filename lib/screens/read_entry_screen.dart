import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journey_app/components.dart';

import '../constants.dart';
import 'add_entry_screen.dart';

class ReadEntryScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadEntryScreen({super.key, required this.docs});

  @override
  State<ReadEntryScreen> createState() => _ReadEntryScreenState();
}

class _ReadEntryScreenState extends State<ReadEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: kScreenBg,
          child: widget.docs.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const JourneyTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Please add Entry',
                          style: kButtonText,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    JourneyButton(
                        label: 'Add Entry',
                        fn: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddEntryScreen(),
                              ));
                        }),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const JourneyTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return EntryTile(
                                title: widget.docs.elementAt(index)['Title'],
                                entry: widget.docs.elementAt(index)['Entry'],
                                dateTime: widget.docs.elementAt(index)['Date'],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: widget.docs.length)),
                    const SizedBox(
                      height: 20,
                    ),
                    JourneyButton(
                        label: 'Back',
                        fn: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
