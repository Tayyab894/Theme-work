import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/theme_data/theme_dark.dart';
import 'package:task_one/theme_data/theme_light.dart';

void main() {
  runApp(const MyApp());
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Center(child: Text("Theme Course")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setStringList("list",["first", "second", "third"]);
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
                "Flutter",
                style: Theme.of(context).textTheme.headline1,
              ),
              Icon(Icons.ac_unit,
                  color: Theme.of(context).iconTheme.color,
                  size: Theme.of(context).iconTheme.size)
            ],
          ),
        ),
      ),
    );
  }
}
