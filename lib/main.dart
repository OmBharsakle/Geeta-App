import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/GeetaProvider.dart';
import 'Screens/Home/View/Home_Page.dart';
import 'Screens/SlapshScreen/SlapshScreen.dart';

void main() {
  runApp(const GeetaApp());
}

class GeetaApp extends StatelessWidget {
  const GeetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      builder: (context, child) {
        HomeProvider homeProvider = Provider.of<HomeProvider>(context);
        return MaterialApp(
          theme: homeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: SlapshScreen(),
        );
      },
    );
  }
}
