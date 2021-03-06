import 'package:flutter/material.dart';
import 'package:responsive_value/responsive_value.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Value',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var textSize = Responsive<double>(18, lg: 24).getValue(context);
    var width = Responsive<double>(100, md: 140, lg: 200).getValue(context);
    var boxColor = Responsive<Color>(Colors.red, lg: Colors.blue).getValue(context);
    var borderRadius = Responsive<double>(0, lg: 10).getValue(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Value'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Responsive Text Size ($textSize px)',
              style: TextStyle(fontSize: textSize),
            ),
            SizedBox(height: 20),
            Container(
              width: width,
              height: 80,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Text(
                  'Responsive Color',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
