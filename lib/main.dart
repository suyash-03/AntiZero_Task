import 'package:antizero_task/Data/choosenData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedData()),
      ],
        child: MaterialApp(home: HomePage())
    );
  }
}
