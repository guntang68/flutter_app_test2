import 'package:flutter/material.dart';
import 'package:flutter_app_test2/utility/dummyData.dart';
import 'package:flutter_app_test2/utility/internetUtility.dart';
import 'package:flutter_app_test2/utility/utility.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // DummyData dummyData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (context) => DummyData(),
          child: MyHomePage(title: 'NiNe Bytes Engineering')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _tempUsers;

  @override
  void initState() {
    super.initState();
    _tempUsers = _getUsers();
  }

  Future<List<User>> _getUsers() async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/VkKnq1INt");
    var jsonData = json.decode(data.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user =
          User(u["index"], u["about"], u["name"], u["email"], u["picture"]);
      print(u["index"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    var dummyData = Provider.of<DummyData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RowType01(1, 20, "Title: RowType01",
                "mengunakkan RowType01 a quick brown fox jumps over the lazy dog ..."),
            RowType02(
                2,
                20,
                "Title: RowType02",
                "mengunakkan RowType02 a quick brown fox jumps over the lazy dog ...",
                Icons.fastfood,
                40,
                Colors.green),
            RowType02(3, 20, "Title: RowType02", "mengunakkan RowType02 icon",
                Icons.forward, 40, Colors.yellow),
            RowType02(
                4, 20, "Title: RowType02", "mengunakkan RowType02 takde icon"),
            RowType02(3, 20, "Map", "Interesting places for family", Icons.map,
                40, Colors.deepPurple),
            GestureDetector(
                onTap: () {
                  // print("sssss");
                  dummyData.inc();

                  GetWebData()
                      .GetData(
                          "https://next.json-generator.com/api/json/get/4JSgC0j4F")
                      .then((value) {
                    print(value[0]["name"]["last"].toString() +
                        "--------------------");
                  },onError: (e){
                        print("error");
                  },);
                },
                child: Text("Salam Dunia " + dummyData.number.toString())),
          ],
        ),
      ),
    );
  }
}

class User {
  final int index;
  final String about;
  final String picture;
  final String name;
  final String email;

  User(this.index, this.about, this.name, this.email, this.picture);
}
