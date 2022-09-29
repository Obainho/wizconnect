import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sburst_up/models/loading_screen.dart';
import 'package:sburst_up/pages/loading_view.dart';
import 'package:sburst_up/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadScreen(),
        ),
      ],
      child: Consumer<LoadScreen>(
        builder: (context, value, child) {
          return value.doneLoading ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          ) : LoadingView(context: context);
        },
      ),
    );
  }
}
