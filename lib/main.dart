import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:summer_calendar/router_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summer_calendar/style_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }

  void _segueToCalender(BuildContext context) {
    Navigator.of(context).pushNamed(Routers.calender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'わくわく夏休みガチャ',
              style: TextStyleManager.s24blackTextStyle
              ,
            ),
            const Text(
              'ガチャを引く',
            ),

            GestureDetector(
              onTap: () => showCustomWidgetDialog(context,widget: test()),
              child: Container(
                height: 50,
                color: Colors.red,
                width: 200,
              ),
            ),
            // GestureDetector(
            //   onTap: () => _incrementCounter(),
            //   child: const Text('こんにちは'),
            // ),
            // GestureDetector(
            //   onTap: () => debugPrint("aaa"),
            //   child: Text(
            //     '$_counter',
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class test extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text("returntext");

    GestureDetector(
      onTap: () => showCustomWidgetDialog(context,widget: test()),
      child: Container(
        height: 50,
        color: Colors.red,
        width: 200,
      ),
    )
  }

}

Future<bool?> showCustomWidgetDialog(BuildContext context,
    {required ConsumerWidget widget}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 18, horizontal: 8),
            child: widget),
      ),
    ),
  );
}