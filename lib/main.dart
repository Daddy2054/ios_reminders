import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/config/custom_theme.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/auth/authenticate_screen.dart';
//import 'package:flutter/widgets.dart';
import 'package:ios_reminders/screens/home/addList/add_list_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';
import 'package:ios_reminders/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

//void main(List<String> args) async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('There was an error'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              StreamProvider<User?>(
                create: (BuildContext context) =>
                    FirebaseAuth.instance.authStateChanges(),
                initialData: FirebaseAuth.instance.currentUser,
              ),
              ChangeNotifierProvider(create: (context) => CustomTheme())
            ],
            child: Wrapper(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
