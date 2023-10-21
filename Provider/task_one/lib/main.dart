import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/theme_data/theme_dark.dart';
import 'package:task_one/theme_data/theme_light.dart';
import 'package:task_one/theme_data/theme_notifier.dart';

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
      themeMode: context.watch<ThemeNotifier>().getThemeStatus
          ? ThemeMode.dark
          : ThemeMode.light,

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

  bool is_dark_theme = false;
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Theme Course",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs
                        .setStringList("list", ["first", "second", "third"]);
                  },
                  child: Text(
                    "Save Value",
                    style: Theme.of(context).textTheme.headline1,
                  )),
              InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final List<String> list = prefs.getStringList('list') ?? [];
                    print("object ${list.toString()}");
                  },
                  child: Text(
                    "Get Value",
                    style: Theme.of(context).textTheme.headline1,
                  )),
              Text(
                "Flutter Theme",
                style: Theme.of(context).textTheme.headline1,
              ),
              InkWell(
                onTap: () {
                  is_dark_theme = !is_dark_theme;
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .SetThemeStatus(
                    is_dark_theme,
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(Icons.ac_unit,
                        color: Theme.of(context).iconTheme.color,
                        size: Theme.of(context).iconTheme.size)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
