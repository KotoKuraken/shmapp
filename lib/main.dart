import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


MyHomePage homePage = new MyHomePage(title: 'Home');
MyMapPage mapPage = new MyMapPage(title: 'Map');
MyInfoPage infoPage = new MyInfoPage(title: 'Info');
MyLoginPage loginPage = new MyLoginPage(title: 'Faculty');
AssetImage map = new AssetImage("images/First.jpg");

class Section{
  var movementConnects;
  var specialConnects;
  var verticalTypes;
  var verticalConnects;
  var movementDirections;
  var specialDirections;
  var verticalDirections;
  bool partOfPath;

  Section(){
    this.movementConnects = new List();
    this.specialConnects = new List();
    this.verticalTypes = new List();
    this.verticalConnects = new List();
    this.movementDirections = new List();
    this.specialDirections = new List();
    this.verticalDirections = new List();
    this.partOfPath = false;
  }

}

class Direct{
  //floorNumber_floorSection
  Section section1_1;

  Section section1_2;

  Section section1_Sp2;

  Section section1_Hub;

  Section section1_Sp3;

  Section section1_3;

  Section section1_4;

  Section section1_5;

  Section section1_Sp1A;

  Section section1_Sp1B;

  Section section1_Sp1C;

  Section section2_1;

  Section section2_2A;

  Section section2_2B;

  Section section2_Sp1;

  Section section2_3;

  Section section2_Hub;

  Section section2_Sp3;

  Section section2_Sp4;

  Section section2_Sp2;

  Section section2_4;

  Section section2_5A;

  Section section2_5B;

  Section section3_1A;

  Section section3_1B;

  Section section3_HubA;

  Section section3_HubB;

  Section section3_HubC;

  Section section3_Sp1;

  Section section3_Sp2;

  Section section3_Sp3;

  Section section3_HubD;

  Section section3_2A;

  Section section3_2B;

  Section section4_1A;

  Section section4_1B;

  Section section4_HubA;

  Section section4_HubB;

  Section section4_HubC;

  Section section4_Sp1;

  Section section4_Sp2;

  Section section4_Sp3;

  Section section4_HubD;

  Section section4_2A;

  Section section4_2B;


  //End of secction creation

  var secMap;

  var checked;

  var toCheck;

  var prevs;

  var directions;

  bool found;




  Direct(){
    this.CreateSections();
    this.CreateConnectionsAndDirections();
    this.CreateSectionMap();
    this.checked = new List();
    this.toCheck = new List();
    this.prevs = new List();
    this.directions = new List();
    this.found == false;
  }

  void CreateSections(){
    this.section1_1 = new Section();

    this.section1_2 = new Section();

    this.section1_Sp2 = new Section();

    this.section1_Hub = new Section();

    this.section1_Sp3 = new Section();

    this.section1_3 = new Section();

    this.section1_4 = new Section();

    this.section1_5 = new Section();

    this.section1_Sp1A = new Section();

    this.section1_Sp1B = new Section();

    this.section1_Sp1C = new Section();

    this.section2_1 = new Section();

    this.section2_2A = new Section();

    this.section2_2B = new Section();

    this.section2_Sp1 = new Section();

    this.section2_3 = new Section();

    this.section2_Hub = new Section();

    this.section2_Sp3 = new Section();

    this.section2_Sp4 = new Section();

    this.section2_Sp2 = new Section();

    this.section2_4 = new Section();

    this.section2_5A = new Section();

    this.section2_5B = new Section();

    this.section3_1A = new Section();

    this.section3_1B = new Section();

    this.section3_HubA = new Section();

    this.section3_HubB = new Section();

    this.section3_HubC = new Section();

    this.section3_Sp1 = new Section();

    this.section3_Sp2 = new Section();

    this.section3_Sp3 = new Section();

    this.section3_HubD = new Section();

    this.section3_2A = new Section();

    this.section3_2B = new Section();

    this.section4_1A = new Section();

    this.section4_1B = new Section();

    this.section4_HubA = new Section();

    this.section4_HubB = new Section();

    this.section4_HubC = new Section();

    this.section4_Sp1 = new Section();

    this.section4_Sp2 = new Section();

    this.section4_Sp3 = new Section();

    this.section4_HubD = new Section();

    this.section4_2A = new Section();

    this.section4_2B = new Section();
  }

  void CreateConnectionsAndDirections(){
    //Instructor hall
    section1_1.movementConnects.add(section1_2);
    section1_1.movementDirections.add("Look towards the brown single door at one end of the hallway.  It will be by rooms 1200 and 1201.  Proceed down the hallway towards that door and pass through it.");

    section1_1.movementConnects.add(section1_Sp1A);
    section1_1.movementDirections.add("Look towards the white double doors at one end of the hallway.  They will be by room 1218.  Proceed toward those doors and go through them.");

    //Hall outside administration and adjacent to instructor hall
    section1_2.movementConnects.add(section1_1);
    section1_2.movementDirections.add("Look towards a brown single door.  It should be near room 1100 and across from administration.  Proceed through it.");

    section1_2.movementConnects.add(section1_Hub);
    section1_2.movementDirections.add("Look towards a door leading outside.  It should be near chairs with small tables attached to them.  Proceed towards that door, but do not go through it.");

    section1_2.specialConnects.add(section1_Sp2);
    section1_2.specialDirections.add("Look towards a brown door with a glass window display.  It should be next to a sign reading \"administration.\"  Proceed through it.");

    //Administration hall
    section1_Sp2.movementConnects.add(section1_2);
    section1_Sp2.movementDirections.add("Look towards the brown door near the desk and room 1103.  Proceed through it.");

    section1_Sp2.movementConnects.add(section1_Hub);
    section1_Sp2.movementDirections.add("Look towards the brown door at the end of the curved hallway.  It should be near room 1127.  Proceed through it.");

    //First floor hub.  Vending and student study area.
    section1_Hub.movementConnects.add(section1_2);
    section1_Hub.movementDirections.add("Look towards a door leading outside that is not near the chairs.  It should be at the end of the hall between the vending area and the wall with the 1108 sign.  Proceed toward this door, but do not go through it.");

    section1_Hub.movementConnects.add(section1_3);
    section1_Hub.movementDirections.add("Head into the hallway behind the student study area.");

    section1_Hub.movementConnects.add(section1_Sp3);
    section1_Hub.movementDirections.add("Look towards brown door next to the sign labeled with 1108.  Head into the unmarked door next to that one.");

    section1_Hub.specialConnects.add(section1_Sp2);
    section1_Hub.specialDirections.add("Look towards the brown door behind the chairs.  It should be near a door leading outside and on the same wall as the vending area.  Proceed through it.");

    section1_Hub.verticalTypes.add("Stairs");
    section1_Hub.verticalConnects.add(section2_Sp2);
    section1_Hub.verticalDirections.add("Look towards a door next to a sign labeled with 1108.  Proceed through that door and up the stairs.");


    //Unlabeled door by stairs across from student area
    section1_Sp3.movementConnects.add(section1_Hub);
    section1_Sp3.movementDirections.add("Look towards the single brown door.  Proceed through it.");

    section1_Sp3.movementConnects.add(section1_Sp1C);
    section1_Sp3.movementDirections.add("Look towards the unlabled double doors.  When facing the doors next to the 1110B sign, these will be on your right.  Proceed through them.");


    //Hallway behind student area
    section1_3.movementConnects.add(section1_Hub);
    section1_3.movementDirections.add("Look in the opposite direction of the double doors.  Proceed in that direction.");

    section1_3.movementConnects.add(section1_4);
    section1_3.movementDirections.add("Look in the direction of the double doors.  Proceed through them.");


    //Computer lab hallway.  Has restrooms.
    section1_4.movementConnects.add(section1_3);
    section1_4.movementDirections.add("Look towards the double doors without handles.  They should be by room 1307.  Proceed through them.");

    section1_4.movementConnects.add(section1_5);
    section1_4.movementConnects.add("Look towards the double doors with handles.  They should be by room 1315.  Proceed through them.");

    section1_4.verticalTypes.add("Elevator");
    section1_4.verticalConnects.add(section2_5A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 2.");

    section1_4.verticalTypes.add("Elevator");
    section1_4.verticalConnects.add(section3_2A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 3.");

    section1_4.verticalTypes.add("Elevator");
    section1_4.verticalConnects.add(section4_2A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 4.");


    //Hallway with freight elevator
    section1_5.movementConnects.add(section1_4);
    section1_5.movementDirections.add("Look towards the brown double doors at the end of the hallway.  Proceed through them.");

    section1_5.verticalTypes.add("Stairs");
    section1_5.verticalConnects.add(section2_5B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 2.");

    section1_5.verticalTypes.add("Stairs");
    section1_5.verticalConnects.add(section3_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 3.");

    section1_5.verticalTypes.add("Stairs");
    section1_5.verticalConnects.add(section4_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 4.");

    section1_5.verticalTypes.add("Freight_Elevator");
    section1_5.verticalConnects.add(section2_5B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the freight elevator near them.  Proceed to floor 2.");

    section1_5.verticalTypes.add("Freight_Elevator");
    section1_5.verticalConnects.add(section3_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the freight elevator near them.  Proceed to floor 3.");

    section1_5.verticalTypes.add("Freight_Elevator");
    section1_5.verticalConnects.add(section4_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the freight elevator near them.  Proceed to floor 4.");


    //Area behind white double doors in instructor hall
    section1_Sp1A.movementConnects.add(section1_1);
    section1_Sp1A.movementDirections.add("Look towards the double doors on the wall across from room 1219.  Proceed through them.");

    section1_Sp1A.movementConnects.add(section1_Sp1B);
    section1_Sp1A.movementDirections.add("Look towards the double doors next to the sign labeled with 1003, then look down the hallway to the right.  Proceed into that hallway.");


    //Hallway with elevator connected to previous area
    section1_Sp1B.movementConnects.add(section1_Sp1A);
    section1_Sp1B.movementDirections.add("Face the wall with the elevator.  Then face left.  Proceed towards the hallway intersection.");

    section1_Sp1B.movementConnects.add(section1_Sp1C);
    section1_Sp1B.movementDirections.add("Face the wall with the elevator.  Then face right.  Proceed towards the hallway intersection.");

    section1_Sp1B.verticalTypes.add("Elevator");
    section1_Sp1B.verticalConnects.add(section2_2B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 2.");

    section1_Sp1B.verticalTypes.add("Elevator");
    section1_Sp1B.verticalConnects.add(section3_1B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 3.");

    section1_Sp1B.verticalTypes.add("Elevator");
    section1_Sp1B.verticalConnects.add(section4_1B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 4.");


    //Hallway connected to previous area.  Exits to the unmarked door near the student area.
    section1_Sp1C.movementConnects.add(section1_Sp1B);
    section1_Sp1C.movementDirections.add("Look down the hallway towards the angled wall.  Proceed down this hallway.");

    section1_Sp1C.movementConnects.add(section1_Sp3);
    section1_Sp1C.movementDirections.add("Look in the direction opposite of the angled wall.  Proceed towards the single white door in this direction, but don't go through it.  Instead, go right and go through the brown double doors.");

  }

  void CreateSectionMap(){
    this.secMap = {
      //First Floor
      "1200" : section1_1,
      "1201" : section1_1,
      "1202" : section1_1,
      "1203" : section1_1,
      "1204" : section1_1,
      "1205" : section1_1,
      "1206" : section1_1,
      "1207" : section1_1,
      "1208" : section1_1,
      "1209" : section1_1,
      "1210" : section1_1,
      "1211" : section1_1,
      "1212" : section1_1,
      "1213" : section1_1,
      "1214" : section1_1,
      "1215" : section1_1,
      "1216" : section1_1,
      "1217" : section1_1,

      "1100" : section1_2,
      "1101" : section1_2,
      "1102" : section1_2,

      "1103" : section1_Sp2,
      "1104" : section1_Sp2,
      "1105" : section1_Sp2,
      "1107" : section1_Sp2,
      "1109" : section1_Sp2,
      "1111" : section1_Sp2,
      "1113" : section1_Sp2,
      "1115" : section1_Sp2,
      "1117" : section1_Sp2,
      "1119" : section1_Sp2,
      "1121" : section1_Sp2,
      "1123" : section1_Sp2,
      "1125" : section1_Sp2,
      "1127" : section1_Sp2,

      "1Hub" : section1_Hub,

      "1110A" : section1_Sp3,
      "1110B" : section1_Sp3,

      "1300" : section1_3,
      "1301" : section1_3,
      "1302" : section1_3,
      "1303" : section1_3,
      "1305" : section1_3,

      "1304" : section1_4,
      "1307" : section1_4,
      "1313" : section1_4,
      "1315" : section1_4,
      "1309" : section1_4,
      "1311" : section1_4,
      "1306" : section1_4,

      "1317" : section1_5,
      "1308" : section1_5,
      "1319" : section1_5,
      "1310" : section1_5,
      "1321" : section1_5,
      "1312" : section1_5,
      "1314" : section1_5,
      "1323" : section1_5,
      "1325" : section1_5,
      "1327" : section1_5,
      "1316" : section1_5,

      "1220A" : section1_Sp1A,
      "1219" : section1_Sp1A,
      "1001" : section1_Sp1A,
      "1002" : section1_Sp1A,
      "1003" : section1_Sp1A,

      "1006" : section1_Sp1B,
      "1007" : section1_Sp1B,

      "1008" : section1_Sp1C,
      "1010" : section1_Sp1C,
      "1009" : section1_Sp1C,
      "1011" : section1_Sp1C,


      //Second Floor
    };
  }

  Section GetSection(String room){
    try {
      return (secMap[room]);
    }
    catch(e){
      return null;
    }
  }

  List FindPath(Section start, Section end){

    CheckAdjacent(start, null, end);
    var theDirections = (this.directions.reversed).toList();
    this.checked = new List();
    this.toCheck = new List();
    this.prevs = new List();
    this.directions = new List();
    this.found = false;

    return theDirections;
  }

  bool CheckAdjacent(Section current, Section previous, Section end){
    //Add the current section to the list of checked sections
    checked.add(current);
    //If the end section has been found, then you're already not part of its path.
    if(this.found == true){
      return(false);
    }

    //If you're the end, let everyone know that the end has been found, tell your predecessor that it is in the path, and add in directions to you
    if(current == end){
      directions.add(previous.movementDirections[previous.movementConnects.indexOf(current)]);
      previous.partOfPath = true;
      this.found = true;
      return(true);
    }
    //If you're not the end, but the end is one of your special connections, add in your directions to the end, then proceed as if you are the end.
    if(current.specialConnects.contains(end)){
      this.directions.add(current.specialDirections[current.specialConnects.indexOf(end)]);
      directions.add(previous.movementDirections[previous.movementConnects.indexOf(current)]);
      this.found = true;
      return(true);
    }


    //For those that have not been checked and are not waiting to be checked, add your connected sections to that list of those that need to be checked
    for(int i = 0; i < current.movementConnects.length; i++){
      if(checked.contains(current.movementConnects[i])){
        continue;
      }
      if(toCheck.contains(current.movementConnects[i])){
        continue;
      }
      toCheck.add(current.movementConnects[i]);
      //Mark yourself as the predecssor
      prevs.add(current);
    }

    //Prepare the next one to check
    Section next = toCheck[0];
    toCheck.removeAt(0);

    Section nextPrev = prevs[0];
    prevs.removeAt(0);

    this.CheckAdjacent(next, nextPrev, end);

    //Check if you are part of the path, and if so, add the directions to you to the path
    if(current.partOfPath && previous != null){
      directions.add(previous.movementDirections[previous.movementConnects.indexOf(current)]);
      previous.partOfPath = true;
      current.partOfPath = false;
    }

    else if(current.partOfPath){
      current.partOfPath = false;
    }

    return(false);

  }


}

final Direct director = new Direct();


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

  Section yourLoc = null;
  Section end = null;
  int currentDirection = 0;
  var directions = new List();
  Text direct = new Text("Directions will be displayed here");
  RaisedButton nextDirect = new RaisedButton(
  child: new Text("Next Step"),
  onPressed: null
  );

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
                        currentDirection = 0;
                        String temp = startLoc.text;
                        if(temp != ""){
                          yourLoc = director.GetSection(temp);
                        }
                        else{
                          yourLoc = null;
                        }
                        temp = endLoc.text;
                        if(temp != ""){
                          end = director.GetSection(temp);
                        }
                        else{
                          end = null;
                        }
                        if(yourLoc == null){
                          setState((){
                            showDialog(context: context,
                            builder:(_) => AlertDialog(content: new Text("Starting location empty or invalid."),
                            actions: <Widget>[FlatButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }
                            )],));
                          });
                        }
                        else if(end == null){
                          setState((){
                            showDialog(context: context,
                                builder:(_) => AlertDialog(content: new Text("Ending location empty or invalid."),
                                  actions: <Widget>[FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }
                                  )],));
                          });
                        }
                        else{
                          directions = director.FindPath(yourLoc, end);
                          currentDirection = 0;
                          setState((){
                            direct = Text(directions[0]);
                            nextDirect = RaisedButton(
                                child: new Text("Next Step"),
                                onPressed: () {
                                  setState(() {
                                    currentDirection++;
                                    if(currentDirection == directions.length){
                                      direct = Text("Your desired location will be in this area.");
                                      nextDirect = RaisedButton(
                                          child: new Text("Next Step"),
                                          onPressed: null
                                      );
                                    }
                                    else{
                                      direct = Text(directions[currentDirection]);
                                    }
                                  });
                                }
                            );
                          });
                        }
//                        switch(yourLoc){
//                          case "first":
//                              setState(() {map = AssetImage("images/First.jpg");});
//                              break;
//
//                          case "second":
//                            setState(() {map = AssetImage("images/Second.jpg");});
//                            break;
//
//                          case "third":
//                            setState(() {map = AssetImage("images/Third.jpg");});
//                            break;
//
//                          case "fourth":
//                            setState(() {map = AssetImage("images/Fourth.jpg");});
//                            break;
//
//                          default:
//                            setState(() {map = AssetImage("images/First.jpg");});
//                        }
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
              child: direct
            ),
            Spacer(flex: 1),
              nextDirect,
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
