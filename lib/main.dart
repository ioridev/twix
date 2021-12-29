import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solarized_theme/solarized_theme.dart';

import 'view/root_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: "env/.env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: buildSolarizedTheme(light: false),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => RootPage(),
        });
  }
}
