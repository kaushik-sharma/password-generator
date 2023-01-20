import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/pages/home/home_page.dart';
import 'package:password_generator/utils/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Password Generator',
        theme: buildThemeData(),
        home: const HomePage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
