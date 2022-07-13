import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core/proxies/proxier.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core/ui/scale.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/proxies/proxy_picture_of_the_day_entity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (BuildContext context) {
        Scale.init(context);
        return const MyHomePage(title: 'Flutter Demo Home Page');
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    PictureOfTheDayEntity picture = ProxyPictureOfTheDayEntity.generateSingle();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(picture.title),
            Text(picture.explanation),
            Text(picture.date.toString()),
            Image.network(picture.hdurl),
            Image.network(picture.url)
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
