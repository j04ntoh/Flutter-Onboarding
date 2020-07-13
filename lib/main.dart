import 'package:flutter/material.dart';
import 'package:flutter_mvc/Onboarding/pagination.dart';
import 'package:flutter_mvc/page1.dart';
import 'package:flutter_mvc/page2.dart';
import 'package:flutter_mvc/page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Onboading Example'),
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

  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 30,
      height: 2,
    );

    final List<Widget> _pages = [
      Page1(),
      Page2(),
      Page3(),
    ];
    int page = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Stack(
        children: <Widget>[
          new Positioned.fill(
            child:Center(
              child: PageView(
                controller: controller,
                children: _pages,
              ),
            ),
          ),
          new Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: new SafeArea(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Pagination(
                      controller: controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        controller.animateToPage(
                          page,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.orange[600],
                                Colors.orange[900],
                              ],
                              begin: Alignment(0.5, -1.0),
                              end: Alignment(0.5, 1.0)
                          ),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('I\'M NEW',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                            ),
                            onPressed: (){},
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.white, width: 1.0),
                          color: Colors.transparent,
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('LOG IN',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                            ),
                            onPressed: (){},
                            highlightColor: Colors.white30,
                            splashColor: Colors.white30,
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}