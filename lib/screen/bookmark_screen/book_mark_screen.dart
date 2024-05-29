import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/google_provider.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final providerTrue = Provider.of<BrowserProvider>(context);
    final providerFalse = Provider.of<BrowserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMark Lists'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(providerTrue.bookmarkList.length, (index) => ListTile(
              onTap: () {
                providerFalse.openWebsite(providerTrue.bookmarkList[index].url);
                Navigator.pop(context);
              },
              title: Text(providerTrue.bookmarkList[index].title),
              subtitle: Text(providerTrue.bookmarkList[index].url,overflow: TextOverflow.ellipsis,),
              trailing: CupertinoButton(
                onPressed: () {
                  providerFalse.deleteBookMark(index);
                },
                child: const Icon(Icons.cancel),
              ),
            ))
        ),
      ),
    );
  }
}
