import 'package:flutter/material.dart';

enum Menu {first,hii,third,forth}

class FirstQuestionListView extends StatefulWidget {
  const FirstQuestionListView({Key? key}) : super(key: key);

  @override
  State<FirstQuestionListView> createState() => _StateFirstQuestionListView();
}

class _StateFirstQuestionListView extends State<FirstQuestionListView> {
  final List<String> item = List.generate(30, (index) => ' item ${index + 1}');


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                setState(() {
                  item.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red,
              ),
              child: Card(
                child: ListTile(
                  title: Center(child: Text(item[index])),
                  trailing: PopupMenuButton<Menu>(
                    onSelected: (value) {
                      print(value.name);
                    },
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        value: Menu.hii,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem(
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem(
                        child: Text('Item 3'),
                      ),
                      const PopupMenuItem(
                        child: Text('Item 4'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
