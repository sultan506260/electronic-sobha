import 'package:flutter/material.dart';

void main() {
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
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(title: 'المسبحه الالكترونية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  String message ='ابدا التسبيح';
  int _counter = 0 ;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;


  void _incrementCounter1() {
    setState(() {
      message= 'سبحان الله';
      _counter=++ _counter1;
    });
  }
  void _incrementCounter2() {
    setState(() {
      message='الحمد الله';
      _counter=++_counter2;
    });
  }
  void _incrementCounter3() {
    setState(() {
      message='  الله اكبر ';
      _counter=++_counter3;
    });
  }

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message ,style: TextStyle(fontSize: 27),),
            Text('$_counter' ,style: TextStyle(fontSize: 27),),

            SizedBox(height: 40,),
            Row(
                children: [
                  SizedBox(width: 40,),
                  ElevatedButton(onPressed: _incrementCounter1 , child: Text('سبحان الله ') ,),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed:_incrementCounter2 , child: Text('الحمد الله ' )),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed:_incrementCounter3 , child: Text('  الله اكبر') )
                ]

            ),

          ],
        ),
      ),
    );
  }
}
