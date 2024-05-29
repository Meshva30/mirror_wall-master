import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/google_provider.dart';
import '../bookmark_screen/book_mark_screen.dart';
import '../history_screen/history_screen.dart';

PopupMenuButton<dynamic> popupmenuButton(BrowserProvider providerTrue, BrowserProvider providerFalse) {
  return PopupMenuButton(
    itemBuilder: (context) {
      return [
        PopupMenuItem(
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BookMarkScreen(),
                ),
              );
            },
            child: const Text('BookMark'),
          ),
        ),
        PopupMenuItem(
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
            child: const Text('History'),
          ),
        ),
        PopupMenuItem(
          child: CupertinoButton(
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Column(children: [
                    RadioListTile(
                      value: 'https://in.search.yahoo.com/',
                      groupValue: providerTrue.uri.toString(),
                      onChanged: (value) {
                        providerFalse.changeWebView(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Yahoo'),
                    ),
                    RadioListTile(
                      value: 'https://www.google.com',
                      groupValue: providerTrue.uri.toString(),
                      onChanged: (value) {
                        providerFalse.changeWebView(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Google'),
                    ),

                    RadioListTile(
                      value: 'https://www.bing.com/',
                      groupValue: providerTrue.uri.toString(),
                      onChanged: (value) {
                        providerFalse.changeWebView(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Bing'),
                    ),
                    RadioListTile(
                      value: 'https://duckduckgo.com/',
                      groupValue: providerTrue.uri.toString(),
                      onChanged: (value) {
                        providerFalse.changeWebView(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Duck Duck Go'),
                    ),

                  ]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),),
                  ],
                );
              },);
            },
            child: const Text('Search Engine'),
          ),
        ),
      ];
    },
  );
}