import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journey_app/components.dart';

import '../constants.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const JourneyTitle(),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: w * 0.8,
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: kTextField,
                child: Center(
                  child: TextFormField(
                    controller: titleController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entry Title',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  width: w * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: SingleChildScrollView(
                    reverse: entryController.text.length > 20 ? true : false,
                    child: Center(
                      child: TextFormField(
                        controller: entryController,
                        cursorColor: Colors.white,
                        maxLines: 15,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Create new Entry',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              JourneyButton(
                  label: "SAVE",
                  fn: () async {
                    if (titleController.text.isEmpty ||
                        entryController.text.isEmpty)
                      print('Please enter title and entry');
                    else {
                      await FirebaseFirestore.instance
                          .collection('entries')
                          .add({
                            'Title': titleController.text,
                            'Entry': entryController.text,
                            'Date': DateFormat.yMMMEd()
                                .add_jm()
                                .format(DateTime.now()),
                          })
                          .then((value) => print('Entry added Successful'))
                          .catchError((error) =>
                              print("Entry not added due to $error"));
                      titleController.clear();
                      entryController.clear();
                    }
                  }),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    entryController.dispose();
    super.dispose();
  }
}
