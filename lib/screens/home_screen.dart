import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nitrous/Services/data.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = Firestore.instance;

  @override
  /* Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _counter; */

  @override
  void initState() {
    super.initState();
    /* _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('UID'));
    }); */
  }

  @override
  void dispose() {
    super.dispose();
  }

  String topic = "Time Documentation";
  String subTopic = "Learn";
  bool switched = false;
  bool breakTime = false;
  final data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(""),
              accountName: Text(""),
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
      body: SingleChildScrollView(
        /* decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)), */
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
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
                        //backgroundImage: NetworkImage(""),
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  shape:
                      Border(right: BorderSide(color: Colors.white, width: 5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                              setState(() {
                                subTopic = value;
                              });
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
                                onChanged: (value) {
                                  setState(() {
                                    switched = value;
                                    if (value == true) {
                                      data.startSoloAction(
                                          topic: topic,
                                          subTopic: subTopic,
                                          title: "test");
                                    } else {
                                      data.endSoloAction();
                                    }
                                  });
                                }),
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
                              breakTime ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //breakTime ? data.endBreak() : data.startBreak();
                              setState(() {
                                breakTime = !breakTime;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "PROGRESS",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: StreamBuilder(
                stream: _firestore
                    .collection('Actions')
                    .document()
                    .collection(Data.user.email)
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  var x = _firestore.collection('Actions').getDocuments();
                  x.then((value) => print(value.documents.length));
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  //print(docs[0].data["title"]);
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      var color = (docs[index].data["status"] == "Ongoing")
                          ? Colors.green
                          : Colors.red;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 15,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: color),
                            ),
                            Text(
                              docs[index].data["topic"],
                              style: TextStyle(color: color),
                            ),
                            Text(docs[index].data["subTopic"],
                                style: TextStyle(color: color)),
                            Text(docs[index].data["title"],
                                style: TextStyle(color: color)),
                            Text(docs[index].data["status"],
                                style: TextStyle(color: color)),
                          ],
                        ),
                      );
                    },
                    itemCount: docs.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
