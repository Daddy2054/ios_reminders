import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/category_icon.dart';
import 'package:ios_reminders/config/custom_theme.dart';
import 'package:ios_reminders/models/category/category.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/models/common/custom_color_collection.dart';
import 'package:ios_reminders/models/common/custom_icon_collection.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/auth/authenticate_screen.dart';
import 'package:ios_reminders/screens/home/widgets/TodoLists.dart';
import 'package:ios_reminders/screens/home/widgets/footer.dart';
import 'package:ios_reminders/screens/home/widgets/grid_view_items.dart';
import 'package:ios_reminders/screens/home/widgets/list_view_items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();

  String layoutType = 'grid';

  @override
  Widget build(BuildContext context) {
    // var todoLists = Provider.of<TodoListCollection>(context).todoLists;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.wb_sunny),
          onPressed: () {
            final customTheme =
                Provider.of<CustomTheme>(context, listen: false);
            customTheme.toggleTheme();
          },
        ),
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              //navigate
            }),
        TextButton(
          onPressed: () {
            if (layoutType == 'grid') {
              setState(() {
                layoutType = 'list';
              });
            } else {
              setState(() {
                layoutType = 'grid';
              });
            }
          },
          child: Text(
            layoutType == 'grid' ? 'Edit' : 'Done',
            // style: TextStyle(color: Colors.white),
          ),
        )
      ]),
      body: Container(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: layoutType == 'grid'
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: GridViewItems(
                    categories: categoryCollection.selectedCategories,
                  ),
                  secondChild:
                      ListViewItems(categoryCollection: categoryCollection),
                ),
                const TodoLists(),
              ],
            ),
          ),
          Footer()
        ],
      )),
    );
  }
}
