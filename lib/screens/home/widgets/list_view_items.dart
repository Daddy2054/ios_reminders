import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category_collection.dart';

const LIST_VIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;

  const ListViewItems({required this.categoryCollection});

  @override
  _ListViewItemsState createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.categoryCollection.categories.length * LIST_VIEW_HEIGHT +
          LIST_VIEW_HEIGHT,
      child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            // print('reordered list');
            print('oldIndex $oldIndex');
            print('newIndex $newIndex');
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            final item = widget.categoryCollection.removeItem(oldIndex);
            setState(() {
              widget.categoryCollection.insert(newIndex, item);
            });
          },
          children: widget.categoryCollection.categories
              .map(
                (category) => SizedBox(
                  key: UniqueKey(),
                  height: LIST_VIEW_HEIGHT,
                  child: ListTile(
                    onTap: () {
                      //toggle checkbox
                      setState(() {
                        category.toggleIsChecked();
                      });
                    },
                    tileColor: Theme.of(context).cardColor,
                    leading: Container(
                      decoration: BoxDecoration(
                          color: category.isChecked
                              ? Colors.blueAccent
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: category.isChecked
                                  ? Colors.blueAccent
                                  : Colors.grey)),
                      child: Icon(
                        Icons.check,
                        color: category.isChecked
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                    title: Row(
                      children: [
                        category.icon,
                        SizedBox(width: 10),
                        Text(category.name),
                      ],
                    ),
                    trailing: Icon(Icons.reorder),
                  ),
                ),
              )
              .toList()),
    );
  }
}
