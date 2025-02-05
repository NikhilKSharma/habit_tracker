import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_data.dart';
// import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/pages/home_page.dart';
// import 'package:habit_tracker/theme/light_mode.dart';
import 'package:habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await HabitDatabase.initialize();
    await HabitDatabase().saveFirstLaunchDate();
  } catch (e) {
    // print('Error initializing database');
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HabitDatabase(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
