import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/models/TripModel.dart';
import 'package:travelling_app/pages/login/signIn.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TripModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveling App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
