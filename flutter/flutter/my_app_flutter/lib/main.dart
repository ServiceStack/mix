import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:servicestack/web_client.dart' if (dart.library.io) 'package:servicestack/client.dart';
import 'dart:io';

import 'dtos.dart';

var baseUrl = "https://localhost:5001";
var clientOptions = ClientOptions(baseUrl: baseUrl);
var client = ClientFactory.createWith(clientOptions);

void main() {
  if (!kReleaseMode && !kIsWeb) {
    if (Platform.isAndroid) {
      clientOptions.baseUrl = "https://10.0.2.2:5001";
      clientOptions.ignoreCertificatesFor.add(clientOptions.baseUrl);
    }
  }

  client = ClientFactory.createWith(clientOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HelloFlutter(title: 'Flutter Demo Home Page'),
    );
  }
}

class HelloFlutter extends StatefulWidget {
  const HelloFlutter({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StatefulWidget> createState() => HelloFlutterState();
}

class HelloFlutterState extends State<HelloFlutter> {
  //State for this widget
  String result = "";
  var myController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    myController.addListener(callService);
  }

  void callService() {
    var text = myController.text.isEmpty ? "World" : myController.text;
    client.get(Hello(name: text)).then((value) => setState(() {
      result = value.result!;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: Column(
                children: [
                  const Text(
                    'Hello API',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'World',
                    ),
                    controller: myController,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Result: $result',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
