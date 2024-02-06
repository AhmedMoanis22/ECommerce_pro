import 'dart:io';

import 'package:flutter/material.dart';

Future<bool> appexitalert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Exit App",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.black),
          ),
          content: const Text('Do you want to exit an app'),
          actions: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                exit(0);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      });
  return Future.value(true);
}
