import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


MyHomePage homePage = new MyHomePage(title: 'Home');
MyMapPage mapPage = new MyMapPage(title: 'Map');
MyInfoPage infoPage = new MyInfoPage(title: 'Info');
MyLoginPage loginPage = new MyLoginPage(title: 'Login');
AssetImage map = new AssetImage("images/First.jpg");

CreateNav(BuildContext context, bool isHome){
  return new Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new ListTile(
        leading: new Icon(Icons.directions_walk),
        title: new Text('Home'),
        onTap: (){
          Navigator.pop(context);
          if(!isHome){
            Navigator.pop(context);
          }
        }
      ),
      new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Map'),
          onTap: (){
            Navigator.pop(context);
            if(!isHome){
              Navigator.pop(context);
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mapPage)
            );
          }
      ),
      new ListTile(
          leading: new Icon(Icons.info),
          title: new Text('Info'),
          onTap: (){
            Navigator.pop(context);
            if(!isHome){
              Navigator.pop(context);
            }
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => infoPage)
            );
          }
      ),
      new ListTile(
        leading: new Icon(Icons.person),
        title: new Text('Faculty Login'),
        onTap: (){
          Navigator.pop(context);
          if(!isHome){
            Navigator.pop(context);
          }
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginPage)
          );
        }
      ),
    ],
  );
}


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      home: homePage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
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
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'This is the Shmapp Home Page',
            ),
            new Spacer(flex: 1),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 70.0,
                  height: 40.0,
                  child: new RaisedButton(
                    child: new Text("Change Page",
                    style: new TextStyle(
                      fontSize: 22.0,
                      ),
                    ),
                    color: Colors.grey[400],
                    onPressed: () {
                      showModalBottomSheet<void>(context: context, builder: (BuildContext context){
                        return CreateNav(context, true);
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))
                  )
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build method

    );
  }
}

class MyMapPage extends StatefulWidget {
  MyMapPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyMapPageState createState() => new _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {

  final startLoc = TextEditingController();
  final endLoc = TextEditingController();

  String yourLoc = "";
  String end = "";

  @override
  void dispose(){
    startLoc.dispose();
    endLoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
            child: PhotoViewGallery(
                pageOptions: <PhotoViewGalleryPageOptions>[
                  PhotoViewGalleryPageOptions(
                      imageProvider: map,
                      heroTag: "tag1"
                  )
                ]
            ),
            height: 400.0),
            new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1),
                  new Container(
                    width: 88.0,
                    child: new TextField(
                        controller: startLoc,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          hintText: "Start"
                        ),
                        style: new TextStyle(
                          fontSize: 14.0,
                          height: 1.0,
                          color: Colors.black,
                        )
                    ),
                  ),
                  Spacer(flex:2),
                  new Container(
                    width: 88.0,
                    child: new TextField(
                        controller: endLoc,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                            hintText: "End"
                        ),
                        style: new TextStyle(
                          fontSize: 14.0,
                          height: 1.0,
                          color: Colors.black,
                        )
                    ),
                  ),
                  Spacer(flex: 2),
                  new RaisedButton(
                      child: new Text("Get Directions"),
                      onPressed: () {
                        yourLoc = startLoc.text;
                        end = endLoc.text;
                        switch(yourLoc){
                          case "first":
                              setState(() {map = AssetImage("images/First.jpg");});
                              break;

                          case "second":
                            setState(() {map = AssetImage("images/Second.jpg");});
                            break;

                          case "third":
                            setState(() {map = AssetImage("images/Third.jpg");});
                            break;

                          case "fourth":
                            setState(() {map = AssetImage("images/Fourth.jpg");});
                            break;

                          default:
                            setState(() {map = AssetImage("images/First.jpg");});
                        }
                      }),
                  Spacer(flex:1)

                ]
            ),
            Spacer(flex: 1),
            new Row(
            children: <Widget>[
              Spacer(flex: 1),
              new Container(
              width: 275.0,
              height: 100.0,
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.black)
              ),
              child: new Text("Directions will be displayed here. rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr")
            ),
            Spacer(flex: 1),
            new RaisedButton(
                child: new Text("Next Step"),
                onPressed: null
            ),
              Spacer(flex: 1)
            ]
            ),
            Spacer(flex: 1),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Spacer(flex:1),
/*                ButtonTheme(
                  minWidth: 50.0,
                  height: 22.0,
                  child: new RaisedButton(
                      child: new Text("Help"),
                      onPressed: null
                  ),
                ),*/
                ButtonTheme(
                    minWidth: 70.0,
                    height: 40.0,
                    child: new RaisedButton(
                        child: new Text("Change Page",
                          style: new TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.grey[400],
                        onPressed: () {
                          showModalBottomSheet<void>(context: context, builder: (BuildContext context){
                            return CreateNav(context, false);
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))
                    )
                ),
//                Spacer(flex:1)
      ]),
                ]),
            ),
        );
  }// This trailing comma makes auto-formatting nicer for build method
  }

class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyInfoPageState createState() => new _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'This is the Shmapp Info Page',
            ),
            new Spacer(flex: 1),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                    minWidth: 70.0,
                    height: 40.0,
                    child: new RaisedButton(
                        child: new Text("Change Page",
                          style: new TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.grey[400],
                        onPressed: () {
                          showModalBottomSheet<void>(context: context, builder: (BuildContext context){
                            return CreateNav(context, false);
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))
                    )
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build method


    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final searchInput = TextEditingController();




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1),
                  new Container(


                    height: 30.0,
                    width: 300.0,
                    child: new TextField(
                        controller: searchInput,
                        decoration: new InputDecoration(


                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ), // icon is 48px widget.
                            ),

                            hintText: "Search: Name, Email, Title, Department..."
                        ),
                        style: new TextStyle(
                          fontSize: 14.0,
                          height: 1.0,
                          color: Colors.black,
                        )
                    ),
                  ),
                  Spacer(flex:2),



                ]
            ),
            new Spacer(flex: 1),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                    minWidth: 70.0,
                    height: 40.0,
                    child: new RaisedButton(
                        child: new Text("Change Page",
                          style: new TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.grey[400],
                        onPressed: () {
                          showModalBottomSheet<void>(context: context, builder: (BuildContext context){
                            return CreateNav(context, false);
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))
                    )
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build method

    );
  }
}
