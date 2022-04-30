import 'package:flutter/material.dart';
import 'direct_to_channel.dart';
// import 'login_view.dart';
import 'channel_list_view.dart';
import 'create_channel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // initialRoute: "/login",
      routes: <String, WidgetBuilder>{
        '/direct_to_channel': (context) => DirectToChannel(),
        // '/login': (context) => LoginView(),
        '/channel_list': (context) => ChannelListView(),
        '/create_channel': (context) => CreateChannelView(),
      },
      home: const MyHomePage(title: 'Cchabbe'),
      theme: ThemeData(
          fontFamily: "Gellix",
          primaryColor: Color(0xff742DDD),
          // buttonColor: Color(0xff742DDD),
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6:
                  TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xff732cdd),
            selectionHandleColor: Color(0xff732cdd),
            selectionColor: Color(0xffD1BAF4),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/cchabbe.png'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/direct_to_channel');
                  // Navigator.pushNamed(context, '/login');
                },
                child: Text('차주와 채팅하기'))
          ],
        ),
      ),
    );
  }
}
