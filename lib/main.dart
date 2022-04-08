import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/provider/task_provider.dart';
import 'package:todolistwithprovider/screen/home.dart';
import 'package:todolistwithprovider/theme/style.dart';
import 'package:todolistwithprovider/widget/DatePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider(),),
        ChangeNotifierProvider(create: (_)=> DatePickerProvider(),),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.theme,
          initialRoute: Home.route,
          routes: {
            Home.route :(context)=> const Home(),
          },
        ),
      );
  }
}
