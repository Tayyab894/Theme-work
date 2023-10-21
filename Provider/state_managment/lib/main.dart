import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_managment/drawer_screen.dart';
import 'package:state_managment/home_screen.dart';
import 'package:state_managment/screen_second.dart';
import 'package:state_managment/theme_data/theme_dark.dart';
import 'package:state_managment/theme_data/theme_light.dart';
import 'package:state_managment/theme_data/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeLight.light_theme,
      darkTheme: ThemeDark.dark_theme,
      themeMode: ThemeMode.light,

      // themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // GetData();

    SetThemeInitialState();
  }

  void SetThemeInitialState() async {
    final prefs = await SharedPreferences.getInstance();
    Provider.of<ThemeNotifier>(context, listen: false).SetThemeStatus(
      prefs.getBool("is_dark_theme") ?? false,
    );
  }

  
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      
    drawer: DrawerScreen(),

      body: context.watch<ThemeNotifier>().getScreenStatus
          ? HomeScreen()
          : SecondScreen(),
    );
  }
}
