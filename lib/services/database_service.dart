import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/models/reminder/reminder.dart';

class DatabaseService {
  final String uid;
  final FirebaseFirestore _database;
  final DocumentReference _userRef;

  DatabaseService({required this.uid})
      : _database = FirebaseFirestore.instance,
        _userRef = FirebaseFirestore.instance.collection('users').doc(uid);

  //1. Create a variable and store firebase instance
  //2. Create reference to users node in firebase
  //3.Methods required
  //   - todoListsStream,
  //   - remindersStream
  //   - addTodoList
  //   - addReminder
  //   - deleteTodoList
  //   - deleteReminder

  Stream<List<TodoList>> todoListStream() {
    return _userRef
        .collection('todo_lists')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (todoListSnapshot) => TodoList.fromJson(
                todoListSnapshot.data(),
              ),
            )
            .toList());
  }

  Stream<List<Reminder>> remindersStream() {
    return _userRef.collection('reminders').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (reminderSnapshot) => Reminder.fromJson(
                  reminderSnapshot.data(),
                ),
              )
              .toList(),
        );
  }

  addTodoList({required TodoList todoList}) async {
    //todoListRef
    //new todo
    //add the todoList
    //throw the error
    final todoListRef =
        _userRef.collection('todo_lists').doc(); //id of the list

    todoList.id = todoListRef.id;

    try {
      await todoListRef.set(
        todoList.toJson(),
      );
      print('list added');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

    Future deleteTodoList(TodoList todoList) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    final todoListRef = _userRef.collection('todo_lists').doc(todoList.id);

    final reminderSnapshots = await _userRef
        .collection('reminders')
        .where('list.id', isEqualTo: todoList.id)
        .get();

    reminderSnapshots.docs.forEach((reminder) {
      //delete the reminder
      batch.delete(reminder.reference);
    });

    batch.delete(todoListRef);

    try {
      await batch.commit();
      print('Deleted');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

   Future addReminder({required Reminder reminder}) async {
    var reminderRef = _userRef.collection('reminders').doc(); // reminderRef.id

    reminder.id = reminderRef.id;

    final listRef = _userRef.collection('todo_lists').doc(reminder.list['id']);

    WriteBatch batch = _database.batch();

    batch.set(reminderRef, reminder.toJson());
    batch.update(
        listRef, {'reminder_count': reminder.list['reminder_count'] + 1});
    try {
      await batch.commit();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
