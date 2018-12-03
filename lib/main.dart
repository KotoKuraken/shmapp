import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:async';
import 'package:sqljocky5/sqljocky.dart' as sqlJocky;


MyHomePage homePage = new MyHomePage(title: 'Home');
MyMapPage mapPage = new MyMapPage(title: 'Map');
MyInfoPage infoPage = new MyInfoPage(title: 'Info');
MyLoginPage loginPage = new MyLoginPage(title: 'Faculty');
MyFacultyResultPage resultPage = new MyFacultyResultPage(title: 'Results');
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
  int floor;

  Section(int floorNum){
    this.movementConnects = new List();
    this.specialConnects = new List();
    this.verticalTypes = new List();
    this.verticalConnects = new List();
    this.movementDirections = new List();
    this.specialDirections = new List();
    this.verticalDirections = new List();
    this.partOfPath = false;
    this.floor = floorNum;
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

  Section section2_Sp5;

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


  //End of section creation

  var secMap;

  var checked;

  var toCheck;

  var prevs;

  var directions;

  bool found;

  String vertS = "stairs";

  String vertE = "elevator";

  String vertFE = "freight_elevator";

  Direct(){
    this.CreateSections();
    this.CreateConnectionsAndDirections();
    this.CreateSectionMap();
    this.checked = new List();
    this.toCheck = new List();
    this.prevs = new List();
    this.directions = new List();
  }

  void CreateSections(){
    this.section1_1 = new Section(1);

    this.section1_2 = new Section(1);

    this.section1_Sp2 = new Section(1);

    this.section1_Hub = new Section(1);

    this.section1_Sp3 = new Section(1);

    this.section1_3 = new Section(1);

    this.section1_4 = new Section(1);

    this.section1_5 = new Section(1);

    this.section1_Sp1A = new Section(1);

    this.section1_Sp1B = new Section(1);

    this.section1_Sp1C = new Section(1);

    this.section2_1 = new Section(2);

    this.section2_2A = new Section(2);

    this.section2_2B = new Section(2);

    this.section2_Sp1 = new Section(2);

    this.section2_3 = new Section(2);

    this.section2_Hub = new Section(2);

    this.section2_Sp3 = new Section(2);

    this.section2_Sp4 = new Section(2);

    this.section2_Sp2 = new Section(2);

    this.section2_4 = new Section(2);

    this.section2_5A = new Section(2);

    this.section2_Sp5 = new Section(2);

    this.section2_5B = new Section(2);

    this.section3_1A = new Section(3);

    this.section3_1B = new Section(3);

    this.section3_HubA = new Section(3);

    this.section3_HubB = new Section(3);

    this.section3_HubC = new Section(3);

    this.section3_Sp1 = new Section(3);

    this.section3_Sp2 = new Section(3);

    this.section3_Sp3 = new Section(3);

    this.section3_HubD = new Section(3);

    this.section3_2A = new Section(3);

    this.section3_2B = new Section(3);

    this.section4_1A = new Section(4);

    this.section4_1B = new Section(4);

    this.section4_HubA = new Section(4);

    this.section4_HubB = new Section(4);

    this.section4_HubC = new Section(4);

    this.section4_Sp1 = new Section(4);

    this.section4_Sp2 = new Section(4);

    this.section4_Sp3 = new Section(4);

    this.section4_HubD = new Section(4);

    this.section4_2A = new Section(4);

    this.section4_2B = new Section(4);
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

    section1_Hub.verticalTypes.add(vertS);
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

    section1_4.verticalTypes.add(vertE);
    section1_4.verticalConnects.add(section2_5A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 2.");

    section1_4.verticalTypes.add(vertE);
    section1_4.verticalConnects.add(section3_2A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 3.");

    section1_4.verticalTypes.add(vertE);
    section1_4.verticalConnects.add(section4_2A);
    section1_4.verticalDirections.add("Look for the elevator.  It should be between the restrooms and room 1307.  Call it and go to floor 4.");


    //Hallway with freight elevator
    section1_5.movementConnects.add(section1_4);
    section1_5.movementDirections.add("Look towards the brown double doors at the end of the hallway.  Proceed through them.");

    section1_5.verticalTypes.add(vertS);
    section1_5.verticalConnects.add(section2_5B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 2.");

    section1_5.verticalTypes.add(vertS);
    section1_5.verticalConnects.add(section3_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 3.");

    section1_5.verticalTypes.add(vertS);
    section1_5.verticalConnects.add(section4_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the staircase behind the door near them.  Proceed to floor 4.");

    section1_5.verticalTypes.add(vertFE);
    section1_5.verticalConnects.add(section2_5B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the freight elevator near them.  Proceed to floor 2.");

    section1_5.verticalTypes.add(vertFE);
    section1_5.verticalConnects.add(section3_2B);
    section1_5.verticalDirections.add("Look towards the white double doors at the end of the hallway.  Proceed towards them, then enter the freight elevator near them.  Proceed to floor 3.");

    section1_5.verticalTypes.add(vertFE);
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

    section1_Sp1B.verticalTypes.add(vertE);
    section1_Sp1B.verticalConnects.add(section2_2B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 2.");

    section1_Sp1B.verticalTypes.add(vertE);
    section1_Sp1B.verticalConnects.add(section3_1B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 3.");

    section1_Sp1B.verticalTypes.add(vertE);
    section1_Sp1B.verticalConnects.add(section4_1B);
    section1_Sp1B.verticalDirections.add("Proceed towards the elevator.  It should be between rooms 1006 and 1007.  Call it and proceed to floor 4.");


    //Hallway connected to previous area.  Exits to the unmarked door near the student area.
    section1_Sp1C.movementConnects.add(section1_Sp1B);
    section1_Sp1C.movementDirections.add("Look down the hallway towards the angled wall.  Proceed down this hallway.");

    section1_Sp1C.movementConnects.add(section1_Sp3);
    section1_Sp1C.movementDirections.add("Look in the direction opposite of the angled wall.  Proceed towards the single white door in this direction, but don't go through it.  Instead, go right and go through the brown double doors.");



    //Second Floor
    //Entry area
    section2_1.movementConnects.add(section2_2A);
    section2_1.movementDirections.add("Look at the brown double doors.  Proceed through them.");

    section2_1.verticalTypes.add(vertS);
    section2_1.verticalConnects.add(section3_1A);
    section2_1.verticalDirections.add("Look at the brown double doors.  Proceed to them, then go into the staircase on the right.  Go to the third floor");

    section2_1.verticalTypes.add(vertS);
    section2_1.verticalConnects.add(section4_1A);
    section2_1.verticalDirections.add("Look at the brown double doors.  Proceed to them, then go into the staircase on the right.  Go to the third floor");

    //First part of hallway near entry
    section2_2A.movementConnects.add(section2_1);
    section2_2A.movementDirections.add("Look toward the double doors with one window each.  Proceed through them.");

    section2_2A.movementConnects.add(section2_2B);
    section2_2A.movementDirections.add("Look toward the double doors with three windows each.  Proceed into that side of the hallway, near room 2225.");

    //Second part of hallway near entry
    section2_2B.movementConnects.add(section2_2A);
    section2_2B.movementDirections.add("Look toward the double doors with one window each.  Proceed into that side of the hallway, near room 2225.");

    section2_2B.movementConnects.add(section2_3);
    section2_2B.movementDirections.add("Look toward the double doors with three windows each.  Proceed through them.");

    section2_2B.specialConnects.add(section2_Sp1);
    section2_2B.specialDirections.add("Look toward elevator.  Proceed toward it, but stop outside of it.  Proceed through the door across from the elevator.");

    section2_2B.verticalTypes.add(vertE);
    section2_2B.verticalConnects.add(section1_Sp1B);
    section2_2B.verticalDirections.add("Look toward elevator.  Go into it and go to the first floor.");

    section2_2B.verticalTypes.add(vertE);
    section2_2B.verticalConnects.add(section3_1B);
    section2_2B.verticalDirections.add("Look toward elevator.  Go into it and go to the third floor.");

    section2_2B.verticalTypes.add(vertE);
    section2_2B.verticalConnects.add(section4_1B);
    section2_2B.verticalDirections.add("Look toward elevator.  Go into it and go to the fourth floor.");

    //Small office room
    section2_Sp1.movementConnects.add(section2_2B);
    section2_Sp1.movementDirections.add("Go through the unmarked door at the end of the hallway across from 2215.");

    //Near staircase 2115
    section2_3.movementConnects.add(section2_2B);
    section2_3.movementDirections.add("Look towards the brown double doors with 3 windows each.  Proceed through them.");

    section2_3.movementConnects.add(section2_Hub);
    section2_3.movementDirections.add("Look towards the large center area.  Proceed into it.");

    section2_3.verticalTypes.add(vertS);
    section2_3.verticalConnects.add(section3_HubA);
    section2_3.verticalDirections.add("Go to the staircase across from room 2116 and proceed to the third floor.");

    section2_3.verticalTypes.add(vertS);
    section2_3.verticalConnects.add(section4_HubA);
    section2_3.verticalDirections.add("Go to the staircase across from room 2116 and proceed to the fourth floor.");

    //Hub
    section2_Hub.movementConnects.add(section2_3);
    section2_Hub.movementDirections.add("Look towards the College of Engineering office.  Proceed into the hallway next to that.");

    section2_Hub.movementConnects.add(section2_4);
    section2_Hub.movementDirections.add("Look towards the School of Computing office.  Proceed into the hallway next to that.");

    section2_Hub.movementConnects.add(section2_Sp2);
    section2_Hub.movementDirections.add("Look towards either room 2117 or 2121.  Proceed through the double doors by one of those rooms.");

    section2_Hub.specialConnects.add(section2_Sp3);
    section2_Hub.specialDirections.add("Look towards the College of Engineering.  Proceed through that door.");

    section2_Hub.specialConnects.add(section2_Sp4);
    section2_Hub.specialDirections.add("Look towards the School of Computing.  Proceed through that door.");

    //College of Engineering office
    section2_Sp3.movementConnects.add(section2_Hub);
    section2_Sp3.movementDirections.add("Proceed into the large central area.");

    //School of Computing office
    section2_Sp4.movementConnects.add(section2_Hub);
    section2_Sp4.movementDirections.add("Proceed into the large central area.");

    //Auditorium Area
    section2_Sp2.movementConnects.add(section2_Hub);
    section2_Sp2.movementDirections.add("Proceed into the large central area.");

    section2_Sp2.verticalTypes.add(vertS);
    section2_Sp2.verticalConnects.add(section1_Hub);
    section2_Sp2.verticalDirections.add("Proceed down the staircase across from the award display.");

    //Near staircase 2100
    section2_4.movementConnects.add(section2_Hub);
    section2_4.movementDirections.add("Proceed into the large central area.");

    section2_4.movementConnects.add(section2_5A);
    section2_4.movementDirections.add("Look toward the double doors at the end of the hallway.  Proceed through them.");

    section2_4.verticalTypes.add(vertS);
    section2_4.verticalConnects.add(section3_HubD);
    section2_4.verticalDirections.add("Proceed up the staircase across from room 2122.  Go to the third floor.");

    section2_4.verticalTypes.add(vertS);
    section2_4.verticalConnects.add(section4_HubD);
    section2_4.verticalDirections.add("Proceed up the staircase across from room 2122.  Go to the fourth floor.");

    //2300 hallway first part
    section2_5A.movementConnects.add(section2_4);
    section2_5A.movementDirections.add("Look toward the double doors at one end of the hallway.  Proceed through them.");

    section2_5A.movementConnects.add(section2_5B);
    section2_5A.movementDirections.add("Look toward the windows at one end of the hallway.  Procced to that side of the hallway near room 2319.");

    section2_5A.specialConnects.add(section2_Sp5);
    section2_5A.specialDirections.add("Look towards the double doors at one end of the hallway.  Proceed in that direction and go into room 2303.");

    section2_5A.verticalTypes.add(vertE);
    section2_5A.verticalConnects.add(section1_4);
    section2_5A.specialDirections.add("Proceed to the elevator near the double door end of the hallway.  Go to the first floor.");

    section2_5A.verticalTypes.add(vertE);
    section2_5A.verticalConnects.add(section3_2A);
    section2_5A.specialDirections.add("Proceed to the elevator near the double door end of the hallway.  Go to the third floor.");

    section2_5A.verticalTypes.add(vertE);
    section2_5A.verticalConnects.add(section4_2A);
    section2_5A.specialDirections.add("Proceed to the elevator near the double door end of the hallway.  Go to the fourth floor.");

    //Chairs Suite
    section2_Sp5.movementConnects.add(section2_5A);
    section2_Sp5.movementDirections.add("Proceed through the brown single door by the desk.");

    //Other half of 2300 hallway
    section2_5B.movementConnects.add(section2_5A);
    section2_5B.movementDirections.add("Look toward the double doors at the end of the hallway.  Proceed to that side of hallway near room 2319.");

    section2_5B.verticalTypes.add(vertS);
    section2_5B.verticalConnects.add(section1_5);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the staircase, and go to the first floor.");

    section2_5B.verticalTypes.add(vertS);
    section2_5B.verticalConnects.add(section3_2B);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the staircase, and go to the third floor.");

    section2_5B.verticalTypes.add(vertS);
    section2_5B.verticalConnects.add(section4_2B);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the staircase, and go to the fourth floor.");

    section2_5B.verticalTypes.add(vertFE);
    section2_5B.verticalConnects.add(section1_5);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the freight elevator, and go to the first floor.");

    section2_5B.verticalTypes.add(vertFE);
    section2_5B.verticalConnects.add(section3_2B);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the freight elevator, and go to the third floor.");

    section2_5B.verticalTypes.add(vertFE);
    section2_5B.verticalConnects.add(section4_2B);
    section2_5B.verticalDirections.add("Look towards the windows at the end of the hall.  Procced toward them, enter the freight elevator, and go to the fourth floor.");


    //Third Floor

    //First half of hallway by parking lot entrance.
    section3_1A.movementConnects.add(section3_1B);
    section3_1A.movementDirections.add("Look toward the double doors at one end of the hallway.  Proceed to that side of the hall, near room 3208.");

    section3_1A.verticalTypes.add(vertS);
    section3_1A.verticalConnects.add(section2_1);
    section3_1A.verticalDirections.add("Proceed to the staircase at the end of the hall.  They should be by room 3217.  Go to the second floor.");

    section3_1A.verticalTypes.add(vertS);
    section3_1A.verticalConnects.add(section4_1A);
    section3_1A.verticalDirections.add("Proceed to the staircase at the end of the hall.  They should be by room 3217.  Go to the fourth floor.");

    //Second half of hallway by parking lot entrance
    section3_1B.movementConnects.add(section3_1A);
    section3_1B.movementDirections.add("Look toward the rail at one end of the hallway.  Proceed to that side of the hall, near room 3208.");

    section3_1B.movementConnects.add(section3_HubA);
    section3_1B.movementDirections.add("Look toward the double doors at the end of the hallway.  Proceed through them.");

    section3_1B.verticalTypes.add(vertE);
    section3_1B.verticalConnects.add(section1_Sp1B);
    section3_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the first floor.");

    section3_1B.verticalTypes.add(vertE);
    section3_1B.verticalConnects.add(section2_2B);
    section3_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the second floor.");

    section3_1B.verticalTypes.add(vertE);
    section3_1B.verticalConnects.add(section4_1B);
    section3_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the fourth floor.");

    //First part of 3rd floor hub
    section3_HubA.movementConnects.add(section3_1B);
    section3_HubA.movementDirections.add("Look toward the double doors by the staircase.  They should be next to room 3203.  Proceed through them.");

    section3_HubA.movementConnects.add(section3_HubB);
    section3_HubA.movementDirections.add("Look toward the staircase.  From looking toward the wall with the \"3108\" label on it, proceed into the pathway to the right.");

    section3_HubA.movementConnects.add(section3_HubC);
    section3_HubA.movementDirections.add("Look toward the pathway with the words \"Civil Enginnering\" above it.  Proceed into that pathway.");

    section3_HubA.verticalTypes.add(vertS);
    section3_HubA.verticalConnects.add(section2_3);
    section3_HubA.verticalDirections.add("Look towards the nearby staircase.  Proceed to the second floor.");

    section3_HubA.verticalTypes.add(vertS);
    section3_HubA.verticalConnects.add(section4_HubA);
    section3_HubA.verticalDirections.add("Look towards the nearby staircase.  Proceed to the fourth floor.");

    //Second part of 3rd floor hub
    section3_HubB.movementConnects.add(section3_HubA);
    section3_HubB.movementDirections.add("Go into the area with the chairs and staircase that is near the side labeled \"Civil Engineering.\"");

    section3_HubB.movementConnects.add(section3_HubD);
    section3_HubB.movementDirections.add("Go into the area with the chairs and staircase that is near the side labeled \"Mechanical Engineering.\"");

    //Third part of 3rd floor hub
    section3_HubC.movementConnects.add(section3_HubA);
    section3_HubC.movementDirections.add("Look towards the side of the hall labeled \"Civil Engineering.\"  Proceed into the open area with the chairs near here.");

    section3_HubC.movementConnects.add(section3_HubD);
    section3_HubC.movementDirections.add("Look towards the side of the hall labeled \"Mechanical Engineering.\"  Proceed into the open area with the chairs near here.");

    section3_HubC.movementConnects.add(section3_Sp1);
    section3_HubC.movementDirections.add("Look towards the side of the hall labeled \"Civil Engineering.\"  Proceed into the closed area on that side of the hall.  It should be room 3142.");

    section3_HubC.movementConnects.add(section3_Sp2);
    section3_HubC.movementDirections.add("Look towards the side of the hall labeled \"Mechanical Engineering.\"  Proceed into the closed area on that side of the hall.  It should be room 3128.");

    //Civil Engineering Office
    section3_Sp1.movementConnects.add(section3_HubC);
    section3_Sp1.movementDirections.add("Look towards the open area outside the windowed wall.  Proceed into it.");

    section3_Sp1.specialConnects.add(section3_Sp3);
    section3_Sp1.specialDirections.add("Proceed into the curved hallway.");


    //Mechanical Engineering Office
    section3_Sp2.movementConnects.add(section3_HubC);
    section3_Sp2.movementDirections.add("Look towards the open area outside the windowed wall.  Proceed into it.");

    section3_Sp2.specialConnects.add(section3_Sp3);
    section3_Sp2.specialDirections.add("Proceed into the curved hallway.");

    //Curved hallway between offices above
    section3_Sp3.movementConnects.add(section3_Sp1);
    section3_Sp3.movementDirections.add("");

    section3_Sp3.movementConnects.add(section3_Sp2);
    section3_Sp3.movementDirections.add("");

    //Fourth part of third floor hub
    section3_HubD.movementConnects.add(section3_HubB);
    section3_HubD.movementDirections.add("Look toward the staircase.  From looking toward the wall with the \"3100\" label on it, proceed into the pathway to the left.");

    section3_HubD.movementConnects.add(section3_HubC);
    section3_HubD.movementDirections.add("Look toward the pathway with the words \"Mechanical Enginnering\" above it.  Proceed into that pathway.");

    section3_HubD.movementConnects.add(section3_2A);
    section3_HubD.movementDirections.add("Look toward the nearby double doors.  They should be by room 3302.  Proceed through them.");

    section3_HubD.verticalTypes.add(vertS);
    section3_HubD.verticalConnects.add(section2_4);
    section3_HubD.verticalDirections.add("Look towards the nearby stiarcase.  Proceed to the second floor.");

    section3_HubD.verticalTypes.add(vertS);
    section3_HubD.verticalConnects.add(section4_HubD);
    section3_HubD.verticalDirections.add("Look towards the nearby stiarcase.  Proceed to the fourth floor.");

    //3300 hallway first half
    section3_2A.movementConnects.add(section3_HubD);
    section3_2A.movementDirections.add("Look toward the double doors at one end of the hallway.  Proceed through them.");

    section3_2A.movementConnects.add(section3_2B);
    section3_2A.movementDirections.add("Look toward the windows at one end of the hallway.  Proceed to the side of the hallway, near room 3312.");

    section3_2A.verticalTypes.add(vertE);
    section3_2A.verticalConnects.add(section1_4);
    section3_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the first floor.");

    section3_2A.verticalTypes.add(vertE);
    section3_2A.verticalConnects.add(section2_5A);
    section3_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the second floor.");

    section3_2A.verticalTypes.add(vertE);
    section3_2A.verticalConnects.add(section4_2A);
    section3_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the fourth floor.");

    //3300 hallway second half
    section3_2B.movementConnects.add(section3_2A);
    section3_2B.movementDirections.add("Look towards the double doors at the end of the hallway.  Proceed to the side of the hallway, near room 3312.");

    section3_2B.verticalTypes.add(vertS);
    section3_2B.verticalConnects.add(section1_5);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the first floor.");

    section3_2B.verticalTypes.add(vertS);
    section3_2B.verticalConnects.add(section2_5B);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the second floor.");

    section3_2B.verticalTypes.add(vertS);
    section3_2B.verticalConnects.add(section4_2B);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the fourth floor.");

    section3_2B.verticalTypes.add(vertFE);
    section3_2B.verticalConnects.add(section1_5);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the first floor.");

    section3_2B.verticalTypes.add(vertFE);
    section3_2B.verticalConnects.add(section2_5B);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the second floor.");

    section3_2B.verticalTypes.add(vertFE);
    section3_2B.verticalConnects.add(section4_2B);
    section3_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the fourth floor.");


    //Fourth Floor

    //First half of hallway by parking lot entrance.
    section4_1A.movementConnects.add(section4_1B);
    section4_1A.movementDirections.add("Look toward the double doors at one end of the hallway.  Proceed to that side of the hall, near room 4208.");

    section4_1A.verticalTypes.add(vertS);
    section4_1A.verticalConnects.add(section2_1);
    section4_1A.verticalDirections.add("Proceed to the staircase at the end of the hall.  They should be by room 4215A.  Go to the second floor.");

    section4_1A.verticalTypes.add(vertS);
    section4_1A.verticalConnects.add(section3_1A);
    section4_1A.verticalDirections.add("Proceed to the staircase at the end of the hall.  They should be by room 4215A.  Go to the third floor.");

    //Second half of hallway by parking lot entrance
    section4_1B.movementConnects.add(section4_1A);
    section4_1B.movementDirections.add("Look toward the rail at one end of the hallway.  Proceed to that side of the hall, near room 4208.");

    section4_1B.movementConnects.add(section4_HubA);
    section4_1B.movementDirections.add("Look toward the double doors at the end of the hallway.  Proceed through them.");

    section4_1B.verticalTypes.add(vertE);
    section4_1B.verticalConnects.add(section1_Sp1B);
    section4_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the first floor.");

    section4_1B.verticalTypes.add(vertE);
    section4_1B.verticalConnects.add(section2_2B);
    section4_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the second floor.");

    section4_1B.verticalTypes.add(vertE);
    section4_1B.verticalConnects.add(section3_1B);
    section4_1B.verticalDirections.add("Look toward the elevator at the end of the hallway.  It should be near the double doors.  Proceed to it and go to the third floor.");

    //First part of 4th floor hub
    section4_HubA.movementConnects.add(section4_1B);
    section4_HubA.movementDirections.add("Look toward the double doors by the staircase.  They should be next to room 4203.  Proceed through them.");

    section4_HubA.movementConnects.add(section4_HubB);
    section4_HubA.movementDirections.add("Look toward the staircase.  From looking toward the wall with the \"4114\" label on it, proceed into the pathway to the right.");

    section4_HubA.movementConnects.add(section4_HubC);
    section4_HubA.movementDirections.add("Look toward the pathway with the words \"Electrical and Computer Engineering\" above it.  Proceed into that pathway.");

    section4_HubA.verticalTypes.add(vertS);
    section4_HubA.verticalConnects.add(section2_3);
    section4_HubA.verticalDirections.add("Look towards the nearby staircase.  Proceed to the second floor.");

    section4_HubA.verticalTypes.add(vertS);
    section4_HubA.verticalConnects.add(section3_HubA);
    section4_HubA.verticalDirections.add("Look towards the nearby staircase.  Proceed to the third floor.");

    //Second part of 4th floor hub
    section4_HubB.movementConnects.add(section4_HubA);
    section4_HubB.movementDirections.add("Go into the area with the chairs and staircase that is near the side labeled \"Electrical and Computer Engineering.\"");

    section4_HubB.movementConnects.add(section4_HubD);
    section4_HubB.movementDirections.add("Go into the area with the chairs and staircase that is near the side labeled \"Chemical and Biomolecular Engineering.\"");

    //Third part of 4th floor hub
    section4_HubC.movementConnects.add(section4_HubA);
    section4_HubC.movementDirections.add("Look towards the side of the hall labeled \"Electrical and Computer Engineering.\"  Proceed into the open area with the chairs near here.");

    section4_HubC.movementConnects.add(section4_HubD);
    section4_HubC.movementDirections.add("Look towards the side of the hall labeled \"Chemical and Biomolecular Engineering.\"  Proceed into the open area with the chairs near here.");

    section4_HubC.movementConnects.add(section4_Sp1);
    section4_HubC.movementDirections.add("Look towards the side of the hall labeled \"Electrical and Computer Engineering.\"  Proceed into the closed area on that side of the hall.  It should be room 4122.");

    section4_HubC.movementConnects.add(section4_Sp2);
    section4_HubC.movementDirections.add("Look towards the side of the hall labeled \"Chemical and Biomolecular Engineering.\"  Proceed into the closed area on that side of the hall.  It should be room 4134.");

    //Electrical and Computer Engineering Office
    section4_Sp1.movementConnects.add(section4_HubC);
    section4_Sp1.movementDirections.add("Look towards the open area outside the windowed wall.  Proceed into it.");

    section4_Sp1.specialConnects.add(section4_Sp3);
    section4_Sp1.specialDirections.add("Proceed into the curved hallway.");


    //Chemical and Biomolecular Engineering
    section4_Sp2.movementConnects.add(section4_HubC);
    section4_Sp2.movementDirections.add("Look towards the open area outside the windowed wall.  Proceed into it.");

    section4_Sp2.specialConnects.add(section4_Sp3);
    section4_Sp2.specialDirections.add("Proceed into the curved hallway.");

    //Curved hallway between above offices
    section4_Sp3.movementConnects.add(section4_Sp1);
    section4_Sp3.movementDirections.add("");

    section4_Sp3.movementConnects.add(section4_Sp1);
    section4_Sp3.movementDirections.add("");

    //Fourth part of 4th floor hub
    section4_HubD.movementConnects.add(section4_HubB);
    section4_HubD.movementDirections.add("Look toward the staircase.  From looking toward the wall with the \"4100\" label on it, proceed into the pathway to the left.");

    section4_HubD.movementConnects.add(section4_HubC);
    section4_HubD.movementDirections.add("Look toward the pathway with the words \"Chemical and Biomolecular Engineering\" above it.  Proceed into that pathway.");

    section4_HubD.movementConnects.add(section4_2A);
    section4_HubD.movementDirections.add("Look toward the nearby double doors.  They should be by room 3302.  Proceed through them.");

    section4_HubD.verticalTypes.add(vertS);
    section4_HubD.verticalConnects.add(section2_4);
    section4_HubD.verticalDirections.add("Look towards the nearby stiarcase.  Proceed to the second floor.");

    section4_HubD.verticalTypes.add(vertS);
    section4_HubD.verticalConnects.add(section3_HubD);
    section4_HubD.verticalDirections.add("Look towards the nearby stiarcase.  Proceed to the third floor.");

    //4300 hallway first half
    section4_2A.movementConnects.add(section4_HubD);
    section4_2A.movementDirections.add("Look toward the double doors at one end of the hallway.  Proceed through them.");

    section4_2A.movementConnects.add(section4_2B);
    section4_2A.movementDirections.add("Look toward the windows at one end of the hallway.  Proceed to the side of the hallway, near room 4314.");

    section4_2A.verticalTypes.add(vertE);
    section4_2A.verticalConnects.add(section1_4);
    section4_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the first floor.");

    section4_2A.verticalTypes.add(vertE);
    section4_2A.verticalConnects.add(section2_5A);
    section4_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the second floor.");

    section4_2A.verticalTypes.add(vertE);
    section4_2A.verticalConnects.add(section3_2A);
    section4_2A.verticalDirections.add("Look towards the elevator.  It should be near the double doors at the end of the hallway.  Proceed into it and go to the third floor.");

    //4300 hallway second half
    section4_2B.movementConnects.add(section4_2A);
    section4_2B.movementDirections.add("Look towards the double doors at the end of the hallway.  Proceed to the side of the hallway, near room 4314.");

    section4_2B.verticalTypes.add(vertS);
    section4_2B.verticalConnects.add(section1_5);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the first floor.");

    section4_2B.verticalTypes.add(vertS);
    section4_2B.verticalConnects.add(section2_5B);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the second floor.");

    section4_2B.verticalTypes.add(vertS);
    section4_2B.verticalConnects.add(section3_2B);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the third floor.");

    section4_2B.verticalTypes.add(vertFE);
    section4_2B.verticalConnects.add(section1_5);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the first floor.");

    section4_2B.verticalTypes.add(vertFE);
    section4_2B.verticalConnects.add(section2_5B);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the second floor.");

    section4_2B.verticalTypes.add(vertFE);
    section4_2B.verticalConnects.add(section3_2B);
    section4_2B.verticalDirections.add("Look towards the staircase.  It should be near the windows at one end of the hallway.  Proceed into it and go to the third floor.");

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
      "2220" : section2_1,
      "2233" : section2_1,

      "2231A" : section2_2A,
      "2218" : section2_2A,
      "2216" : section2_2A,
      "2229" : section2_2A,
      "2227" : section2_2A,
      "2214" : section2_2A,

      "2225" : section2_2B,
      "2212" : section2_2B,
      "2223" : section2_2B,
      "2221" : section2_2B,
      "2210" : section2_2B,
      "2204" : section2_2B,
      "2202" : section2_2B,
      "2200" : section2_2B,
      "2205" : section2_2B,

      "2219" : section2_Sp1,
      "2217" : section2_Sp1,
      "2215": section2_Sp1,

      "2201" : section2_3,
      "2203" : section2_3,
      "2209" : section2_3,

      "2114" : section2_Hub,
      "2117" : section2_Hub,
      "2121" : section2_Hub,
      "2101" : section2_Hub,

      "2110" : section2_Sp3,
      "2111" : section2_Sp3,
      "2112" : section2_Sp3,
      "2113" : section2_Sp3,

      "2103" : section2_Sp4,
      "2104" : section2_Sp4,
      "2105" : section2_Sp4,
      "2106" : section2_Sp4,

      "2119" : section2_Sp2,

      "2122" : section2_4,

      "2307" : section2_5A,
      "2303" : section2_5A,
      "2309" : section2_5A,
      "2311" : section2_5A,
      "2313" : section2_5A,
      "2315" : section2_5A,
      "2314" : section2_5A,
      "2316" : section2_5A,
      "2317" : section2_5A,
      "2318" : section2_5A,

      "2319" : section2_5B,
      "2321" : section2_5B,
      "2320" : section2_5B,
      "2323" : section2_5B,
      "2322" : section2_5B,
      "2324" : section2_5B,
      "2325" : section2_5B,
      "2326" : section2_5B,
      "2327" : section2_5B,
      "2328" : section2_5B,
      "2329" : section2_5B,
      "2330" : section2_5B,

      //Third Floor
      "3217" : section3_1A,
      "3216" : section3_1A,
      "3214" : section3_1A,
      "3215A" : section3_1A,
      "3213" : section3_1A,
      "3212" : section3_1A,
      "3211" : section3_1A,
      "3210" : section3_1A,

      "3208" : section3_1B,
      "3209" : section3_1B,
      "3206" : section3_1B,
      "3207" : section3_1B,
      "3204" : section3_1B,
      "3202" : section3_1B,
      "3205" : section3_1B,
      "3200" : section3_1B,

      "3203" : section3_HubA,
      "3201" : section3_HubA,

      "3107" : section3_HubB,
      "3106" : section3_HubB,
      "3105" : section3_HubB,
      "3104" : section3_HubB,

      "3142" : section3_HubC,
      "3136" : section3_HubC,
      "3128" : section3_HubC,

      "3137" : section3_Sp1,
      "3117" : section3_Sp1,
      "3116" : section3_Sp1,
      "3115" : section3_Sp1,
      "3114" : section3_Sp1,
      "3113" : section3_Sp1,
      "3111" : section3_Sp1,
      "3110" : section3_Sp1,
      "3109" : section3_Sp1,

      "3134" : section3_Sp2,
      "3143" : section3_Sp2,
      "3133" : section3_Sp2,
      "3132" : section3_Sp2,
      "3131" : section3_Sp2,
      "3130" : section3_Sp2,
      "3129" : section3_Sp2,
      "3127" : section3_Sp2,
      "3135" : section3_Sp2,
      "3141" : section3_Sp2,

      "3126" : section3_Sp3,
      "3125" : section3_Sp3,
      "3124" : section3_Sp3,
      "3140" : section3_Sp3,
      "3123" : section3_Sp3,
      "3122" : section3_Sp3,
      "3121" : section3_Sp3,
      "3139" : section3_Sp3,
      "3120" : section3_Sp3,
      "3119" : section3_Sp3,
      "3138" : section3_Sp3,

      "3100" : section3_HubD,
      "3101" : section3_HubD,
      "3102" : section3_HubD,
      "3103" : section3_HubD,

      "3301" : section3_2A,
      "3304" : section3_2A,
      "3303" : section3_2A,
      "3305" : section3_2A,
      "3306" : section3_2A,
      "3307" : section3_2A,
      "3309" : section3_2A,
      "3308" : section3_2A,
      "3311" : section3_2A,
      "3310" : section3_2A,
      "3313" : section3_2A,

      "3312" : section3_2B,
      "3315" : section3_2B,
      "3317" : section3_2B,
      "3319" : section3_2B,
      "3314" : section3_2B,
      "3321" : section3_2B,
      "3316" : section3_2B,
      "3323" : section3_2B,
      "3318" : section3_2B,

      //Fourth floor
      "4214" : section4_1A,
      "4217" : section4_1A,
      "4215A" : section4_1A,
      "4212" : section4_1A,
      "4213" : section4_1A,
      "4210" : section4_1A,
      "4211" : section4_1A,

      "4208" : section4_1B,
      "4209" : section4_1B,
      "4206" : section4_1B,
      "4207" : section4_1B,
      "4204" : section4_1B,
      "4202" : section4_1B,
      "4205" : section4_1B,
      "4200" : section4_1B,

      "4203" : section4_HubA,
      "4201" : section4_HubA,

      "4101" : section4_HubB,
      "4102" : section4_HubB,
      "4103" : section4_HubB,
      "4104" : section4_HubB,
      "4105" : section4_HubB,
      "4106" : section4_HubB,
      "4107" : section4_HubB,
      "4108" : section4_HubB,
      "4109" : section4_HubB,
      "4110" : section4_HubB,
      "4111" : section4_HubB,
      "4112" : section4_HubB,
      "4113" : section4_HubB,

      "4122" : section4_HubC,
      "4142" : section4_HubC,
      "4134" : section4_HubC,

      "4133" : section4_Sp1,
      "4135" : section4_Sp1,
      "4136" : section4_Sp1,
      "4137" : section4_Sp1,
      "4138" : section4_Sp1,
      "4139" : section4_Sp1,
      "4140" : section4_Sp1,

      "4116" : section4_Sp2,
      "4117" : section4_Sp2,
      "4115" : section4_Sp2,
      "4118" : section4_Sp2,
      "4119" : section4_Sp2,
      "4120" : section4_Sp2,
      "4121" : section4_Sp2,
      "4143" : section4_Sp2,
      "4123" : section4_Sp2,

      "4144" : section4_Sp3,
      "4124" : section4_Sp3,
      "4125" : section4_Sp3,
      "4126" : section4_Sp3,
      "4127" : section4_Sp3,
      "4145" : section4_Sp3,
      "4128" : section4_Sp3,
      "4146" : section4_Sp3,
      "4129" : section4_Sp3,
      "4130" : section4_Sp3,
      "4131" : section4_Sp3,
      "4132" : section4_Sp3,
      "4147" : section4_Sp3,

      "4300" : section4_HubD,
      "4302" : section4_HubD,

      "4301" : section4_2A,
      "4304" : section4_2A,
      "4306" : section4_2A,
      "4303" : section4_2A,
      "4305" : section4_2A,
      "4308" : section4_2A,
      "4307" : section4_2A,
      "4309" : section4_2A,
      "4310" : section4_2A,
      "4311" : section4_2A,
      "4312" : section4_2A,
      "4313" : section4_2A,

      "4314" : section4_2B,
      "4315" : section4_2B,
      "4316" : section4_2B,
      "4317" : section4_2B,
      "4318" : section4_2B,
      "4319" : section4_2B,
      "4320" : section4_2B,
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

  List FindPath(Section start, Section end, bool accessIssues){

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
      if(previous != null){
        previous.partOfPath = true;
      }
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
        title: new Text('Faculty'),
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


void main() async => runApp(new MyApp());

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

var _values = ['1st Floor', '2nd Floor', '3rd Floor', '4th Floor'];
var _selectedItem = '2nd Floor';

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
                          imageProvider: AssetImage("images/First.jpg"),
                          heroTag: "1st Floor",
                      ),
                      PhotoViewGalleryPageOptions(
                          imageProvider: AssetImage("images/Second.jpg"),
                          heroTag: "2nd Floor",
                      ),
                      PhotoViewGalleryPageOptions(
                          imageProvider: AssetImage("images/Third.jpg"),
                          heroTag: "3rd Floor",
                      ),
                      PhotoViewGalleryPageOptions(
                          imageProvider: AssetImage("images/Fourth.jpg"),
                          heroTag: "4th Floor",
                      ),
                    ]
                ),
                height: 400.0),
            new DropdownButton<String>(
              items: _values.map((String dropDownStringItem){
                return new DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValue){
                setState(() {
                  this._selectedItem = newValue;
                });
              },
              value: _selectedItem,
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
  Direct director = new Direct();

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
                          directions = director.FindPath(yourLoc, end, false);
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
  List<String> myList = new List();
  List<String> names = new List();

  Icon _searchIcon = new Icon(Icons.search);
  String errorText = "";
  String _searchText = "";
  Widget _appBarTitle = new Text( 'Search Example' );
  List<String> resultList = new List();
  var resultMap = new Map();
  var outputText = "";



  sqlJocky.MySqlConnection conn;


  _MyLoginPageState(){
    searchInput.addListener(() {
      if (searchInput.text.isEmpty) {
        setState(() {
          _searchText = "";
          myList = names;
        });
      } else {
        setState(() {
          _searchText = searchInput.text;
        });
      }
    });

  }
  @override
  void initState(){
    this.openConnection();
    super.initState();


  }

  openConnection() async{
    var connectionSettings = sqlJocky.ConnectionSettings(
      user: "root",
      password: "BooBooBla2",
      host: "10.0.2.2",
      port: 3306,
      db: "PeanutRoom",
    );
    // create a connection
    print("Opening connection ...");
    try{
      conn = await sqlJocky.MySqlConnection.connect(connectionSettings);
      print("Opened connection!");
      readData();
    }
    catch(e)
    {
      setState(() {
        errorText = "An error occured while connecting to the database.\n                           Please try again later.";
      });


    }


    //await conn.close();


  }
  void readData() async {
    sqlJocky.Results result =
    await conn.execute("SELECT name FROM employee;"

    );
    List<String> tempList = new List();
    for(int i = 0; i < result.length;i++){
      tempList.add(result.elementAt(i).first);
    }
    sqlJocky.Results orgResult =
    await conn.execute("SELECT name FROM organizations;"

    );
    for(int i = 0; i < orgResult.length;i++){
      tempList.add(orgResult.elementAt(i).first);
    }
    setState((){
      names = tempList;
      names.sort();
      myList = names;
      print(names);
    });


  }
  void outputData(String input)async{
    sqlJocky.Results result =
    await conn.execute("SELECT * FROM employee Left join organizations On employee.OrganizationID = organizations.OrganizationId WHERE employee.name = '$input' OR organizations.name = '$input';"

    );

    resultList.clear();
    var resultString = result.toString().substring(2,result.toString().length - 2);
    resultList = resultString.split(",");
    
    resultMap = {"Employee Name" : resultList[1], "Title" : resultList[2], "Email" : resultList[3], "Department" : resultList[4], "Office #" : resultList[5], "Organization Name" : resultList[8], "Room #" : resultList[9], "Description" : resultList[10], "Membership Dues" : resultList[11]};
    print(resultMap);
    var keyList = new List();
    resultMap.forEach((k,v){
      if(v == " null")
      {
        keyList.add(k);
      }
    });
    for(int i = 0; i < keyList.length; i++)
      {
        resultMap.remove(keyList[i]);
      }
    resultMap.forEach((k,v) => outputText += "\n\n" + ('${k}: ${v}'));

    print(resultList);
    print(outputText);

  }
  Widget _buildList() {
    if(errorText.isEmpty)
    {
      if (!(searchInput.text.isEmpty)) {
        List<String> tempList = new List();
        for (int i = 0; i < myList.length; i++) {
          if (myList[i].toLowerCase().contains(searchInput.text.toLowerCase())) {
            tempList.add(myList[i]);
          }
        }
        myList = tempList;
      }
      return ListView.builder(
        itemCount: names == null ? 0 : myList.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(myList[index]),
            onTap: () {
              outputData(myList[index]);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => new MyFacultyResultPage(title: myList[index], returnList: resultList, returnMap: outputText)));

            },
          );
        },
      );
    }
    else {
      return new Text(errorText);
    }

  }
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: searchInput,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Example' );
        myList = names;
        searchInput.clear();
      }
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new Container(


                    height: 30.0,
                    width: 300.0,

                    child:
                    new TextField(

                        controller: searchInput,

                        decoration: new InputDecoration(


                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: IconButton(
                                icon: _searchIcon,
                                onPressed: _searchPressed,

                              ), // icon is 48px widget.
                            ),

                            hintText: "Search: Name or Organization..."
                        ),
                        style: new TextStyle(
                          fontSize: 14.0,
                          height: 1.0,
                          color: Colors.black,
                        )
                    ),
                  ),

                ]
            ),
            new Spacer(flex:1),
            new Expanded(
                flex: 3,
                child: _buildList(),


            ),
            new Spacer(flex: 1),

            new Column(
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
      resizeToAvoidBottomPadding: false,
    );
  }
}
class MyFacultyResultPage extends StatefulWidget {
  final List returnList;
  final String title;
  final String returnMap;

  MyFacultyResultPage({Key key, this.title, @required this.returnList, @required this.returnMap}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  _MyFacultyResultPageState createState() => new _MyFacultyResultPageState();
}

class _MyFacultyResultPageState extends State<MyFacultyResultPage> {



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
      body: new Container(
          //"EMPLOYEE\n\n" + "Name: " + widget.returnList[1] + "\nTitle: " + widget.returnList[2]  + "\nEmail: " + widget.returnList[3] + "\nDepartment: " + widget.returnList[4] + "\nOffice #: " + widget.returnList[5]
            child: new Text(widget.returnMap.toString()),
            /*child: Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Name"),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(widget.returnList[1]== " null"? "NA" : widget.returnList[1]),
                        ],
                      ),
                    )
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Title"),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(widget.returnList[2]== " null"? "NA" : widget.returnList[2]),
                        ],
                      ),
                    )
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Email"),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(widget.returnList[3] == " null"? "NA" : widget.returnList[3]),
                        ],
                      ),
                    )
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Department"),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(widget.returnList[4].toString() == ' null'? 'NA' : widget.returnList[4]),
                        ],
                      ),
                    )
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Office #"),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(widget.returnList[5]== " null"? "NA" : widget.returnList[5]),
                        ],
                      ),
                    )
                  ]),
                ]


            )*/
        ),
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

        );
       // This trailing comma makes auto-formatting nicer for build method



  }
}
