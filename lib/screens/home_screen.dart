import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TTT extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<TTT> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String topic = "Time Documentation";
  String subTopic = "Learn";
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("Mostafa.ashraf.93@gmail.com"),
              accountName: Text("Mostafa Ashraf"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: new IconButton(
                icon: new Icon(Icons.home, color: Colors.black),
                onPressed: () => null,
              ),
              title: Text('Home'),
              onTap: null,
            ),
            ListTile(
              leading: new IconButton(
                icon: new Icon(Icons.settings, color: Colors.black),
                onPressed: null,
              ),
              title: Text('Settings'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Mostafa Ashraf',
                            style: TextStyle(
                              fontFamily: 'Modak',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'App Developer',
                            style: TextStyle(
                              fontFamily: 'Modak',
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 150, left: 230),
                    child: new Container(
                      width: 90.0,
                      height: 90.0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(""),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Activity',
                    style: TextStyle(
                      fontFamily: 'Modak',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Currently you are doing...',
                          style: TextStyle(
                            fontFamily: 'Modak',
                            fontSize: 24,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                        value: topic,
                        items: [
                          DropdownMenuItem(
                            child: Text("Time Documentation"),
                            value: "Time Documentation",
                          ),
                        ],
                        onChanged: (value) {
                          topic = value;
                          //notifyListeners();
                        }),
                    DropdownButton(
                        value: subTopic,
                        items: [
                          DropdownMenuItem(
                            child: Text("Learn"),
                            value: "Learn",
                          ),
                          DropdownMenuItem(
                            child: Text("Teach"),
                            value: "Teach",
                          ),
                          DropdownMenuItem(
                            child: Text("Break"),
                            value: "Break",
                          ),
                        ],
                        onChanged: (value) {
                          subTopic = value;
                          //notifyListeners();
                        }),
                    FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text("Add topic")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("End"),
                        Switch(
                            value: switched,
                            onChanged: (value) => switched = value),
                        Text("Start")
                      ],
                    ),
                    Text("Break"),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: IconButton(
                        icon: Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
