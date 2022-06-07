import 'package:flutter/material.dart';

class ListviewReorderable extends StatefulWidget {
  const ListviewReorderable({Key? key}) : super(key: key);

  @override
  State<ListviewReorderable> createState() => _StateListviewReorderable();
}

class _StateListviewReorderable extends State<ListviewReorderable> {
  final List<String> item = List.generate(30, (index) => ' item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable listview'),
      ),
      body: Scrollbar(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              final String value = item.removeAt(oldIndex);
              item.insert(newIndex, value);
            });
          },
          children: [
            for (int index = 0; index < item.length; index++)
              ListTile(
                key: UniqueKey(),
                title: Text(item[index]),
              )
          ],
        ),
      ),
    );
  }
}
