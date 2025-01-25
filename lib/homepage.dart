import 'package:educationapk/allpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMainHome(),
      debugShowCheckedModeBanner: false,
      title: 'home page',
    );
  }
}
class MyMainHome extends StatefulWidget {
  const MyMainHome({super.key});

  @override
  State<MyMainHome> createState() => _MyMainHomeState();
}

class _MyMainHomeState extends State<MyMainHome> {
  List<String> listName=[
    "All",
    "Study",
    "Programming",
    "Attendance",
    "Branches",
    "Events",
    "Map",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,top: 50),
                            child: Image.asset('assets/images/user.png',height: 30,color: Colors.white),
                          ),
                          SizedBox(width: 23,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 50),
                                child: Text('Name ?', style: TextStyle(fontSize: 17,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Text('Good Morning', style: TextStyle(fontSize: 13,fontFamily: 'sans-serif-thin',color:Colors.white),),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 160,top: 50),
                            child:
                            PopupMenuButton<String>(
                              onSelected: (String value) {
                                // Handle menu item selection
                                print('Selected: $value');
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    value: 'Profile',
                                    child: Text('Profile', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Settings',
                                    child: Text('Settings', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Logout',
                                    child: Text('Logout', style: TextStyle(fontSize: 15,fontFamily: 'sans-serif-thin')),
                                  ),
                                ];
                              },
                              icon: Icon(Icons.menu,size: 30,color: Colors.white), // Icon to display
                              elevation: 5, // Shadow elevation
                              color: Colors.white, // Background color
                              offset: Offset(0, 45), // Positioning of the menu
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.all(16),
                        child:TextField(style: TextStyle( fontFamily: 'sans-serif-light',height: 1.3,color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search,size: 30,color: Colors.white),
                            fillColor: Colors.white,
                            hintText: 'Search',hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder( // Unfocused border color
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),// Focused border color
                                borderRadius: BorderRadius.circular(35)
                            ),

                          ),

                        ),
                      ),
                      Row(
                        children: [
                          Text("    Let's Explore\n        The Polyverse",style: TextStyle(fontSize: 42,fontFamily:'sans-serif-thin',color: Colors.white),),
                        ],
                      ),
                      SizedBox(height: 15,),

                      SizedBox(
                        height: 83,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listName.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (listName[index] == "All") {
                                          Get.to(()=>MainScrollPage());
                                        }
                                      },
                                      child: Container(
                                        width: 125,
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color: Colors.black12, width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.lightBlueAccent,
                                              blurRadius: 15,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            listName[index],
                                            style: TextStyle(fontFamily: 'sans-serif-thin', fontSize: 15),
                                            textAlign: TextAlign.center, // Center align the text
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(

                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(15),
                                height: 200,
                                width: 190,
                                decoration:
                                BoxDecoration(
                                  color: Color(0xFFFF789F), // Background color
                                  borderRadius: BorderRadius.circular(20),// Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFFF789F), // Shadow color
                                      blurRadius: 15, // Shadow blur radius
                                      offset: Offset(0, 4), // Shadow offset
                                    ),
                                  ],
                                ),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child:
                                          Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                        ),
                                        SizedBox(width: 105,),
                                        Container(
                                          child:
                                          Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('App',style: TextStyle(fontSize: 30,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                            Text('Designing',style: TextStyle(fontSize: 30,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('78 Days',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                        SizedBox(width: 23,),
                                        Text('2 Developer\'s',style: TextStyle(fontFamily: 'sans-serif-thin'),),
                                      ],
                                    )
                                  ],
                                )
                            ),
                            Container(

                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(12),
                                height: 200,
                                width: 155,
                                decoration:
                                BoxDecoration(
                                  color: Color(0x6E6EFFAB), // Background color
                                  borderRadius: BorderRadius.circular(20),// Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x6E6EFFAB), // Shadow color
                                      blurRadius: 15, // Shadow blur radius
                                      offset: Offset(0, 4), // Shadow offset
                                    ),
                                  ],
                                ),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child:
                                          Icon(Icons.timelapse_sharp,size: 30,color: Colors.black),
                                        ),
                                        SizedBox(width: 70,),
                                        Container(
                                          child:
                                          Icon(Icons.arrow_forward_ios_outlined,size: 28,color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Teachers',style: TextStyle(fontSize: 24,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                        Text('68 Members',style: TextStyle(fontSize: 14,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                      ],
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                      Container(

                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(12),
                          height: 200,
                          width: 375,
                          decoration:
                          BoxDecoration(
                            color: Colors.lightBlueAccent, // Background color
                            borderRadius: BorderRadius.circular(20),// Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.lightBlueAccent, // Shadow color
                                blurRadius: 20, // Shadow blur radius
                                offset: Offset(0, 4), // Shadow offset
                              ),
                            ],
                          ),

                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child:
                                    Icon(Icons.person_pin,size: 45,color: Colors.black),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Deep',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                                      Text('Designer',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 12),),
                                    ],
                                  ),
                                  SizedBox(width: 177,),
                                  Container(
                                    child:
                                    Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(' Course',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 20),),
                                      Text('App Development',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 18),),
                                      Text(' 3 Months',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 15),),
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  SizedBox(
                                      child: Container(
                                        height: 100,
                                        width: 2,
                                        color: Colors.black,
                                      )
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('    Tools',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 20),),
                                      Text('   Flutter , Dart',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 18),),
                                      Text('     Firebase',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 15),),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}

