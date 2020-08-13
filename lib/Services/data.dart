import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nitrous/models/models/subTopic.dart';
import 'package:nitrous/models/models/topic.dart';

import '../models/models/solo_action.dart';
import '../models/models/user.dart';

class Data {
  static User user = User(email: "test@test.com", soloActions: []);
  SoloAction action;
  final _firestore = Firestore.instance;
  final _storage = FirebaseStorage.instance;
  getUserInfo(email) async {
    var document = await _firestore.collection("Users").document(email).get();
    setUser(User(
      email: document.data["email"],
      imgUrl: document.data["imgUrl"],
      userName: document.data["userName"],
      jobTitle: document.data["jobTitle"],
    ));
  }

  setUser(user) {
    user = user;
  }

  getUserSoloActions() async {
    var documents = await _firestore
        .collection("Actions")
        .document(user.email)
        .collection(user.email)
        .getDocuments();

    documents.documents.forEach((element) {
      user.soloActions.add(SoloAction(
        id: element.data["id"],
        topic: element.data["topic"],
        subTopic: element.data["subTopic"],
        title: element.data["title"],
        startTime: element.data["startTime"],
        endTime: element.data["endTime"],
        userID: element.data["userID"],
        duration: element.data["duration"],
        status: element.data["status"],
        factor: element.data["factor"],
        date: element.data["date"],
      ));
    });
  }

  Future<void> uploadPic() async {
    //Get the file from the image picker and store it
    final file = ImagePicker();
    PickedFile pickedImage = await file.getImage(source: ImageSource.gallery);
    File image = File(pickedImage.path);

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("images/${user.email}");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    if (uploadTask.isInProgress) {
      print("loading");
    } else if (uploadTask.isComplete) {
      user.imgUrl = (await reference.getDownloadURL()).toString();
    }
  }

  void startSoloAction({topic, subTopic, title}) {
    var date = DateTime.now();
    var formatedDate = DateFormat.yMMMEd().format(date);
    DocumentReference documentReference = _firestore
        .collection("Actions")
        .document(user.email)
        .collection(user.email)
        .document();
    action = SoloAction(
        id: documentReference.documentID,
        topic: Topic(title: topic),
        subTopic: SubTopic(subTopic),
        title: title,
        startTime: "${date.hour} : ${date.minute}",
        date: date,
        formatedDate: formatedDate,
        factor: 1,
        status: "Ongoing",
        userID: user.email);

    documentReference.setData({
      "id": documentReference.documentID,
      "topic": action.topic.title,
      "subTopic": action.subTopic.title,
      "title": action.title,
      "startTime": "${action.startTime}",
      "endTime": "${date.hour} : ${date.minute}",
      "duration": action.duration,
      "breakStartTime": action.breakStartTime,
      "breakEndTime": action.breakEndTime,
      "breakDuration": action.breakDuration,
      "formatedDate": action.formatedDate,
      "date": action.date,
      "factor": 1,
      "status": "Ongoing",
      "userID": user.email
    });

    user.soloActions.add(action);
  }

  void endSoloAction() {
    var date = DateTime.now();
    var start = action.startTime.split(":");
    var duration = ((date.hour - int.parse(start[0])) * 60) +
        (date.minute - int.parse(start[1]));
    DocumentReference documentReference = _firestore
        .collection("Actions")
        .document(user.email)
        .collection(user.email)
        .document(action.id);
    documentReference.updateData({
      "duration": duration,
      "endTime": "${date.hour} : ${date.minute}",
      "status": "Done"
    });
    action = null;
  }

  void startBreak() {
    var date = DateTime.now();
    DocumentReference documentReference = _firestore
        .collection("Actions")
        .document(user.email)
        .collection(user.email)
        .document(action.id);
    documentReference
        .updateData({"breakStartTime": "${date.hour} : ${date.minute}"});
  }

  void endBreak() {
    DocumentReference documentReference = _firestore
        .collection("Actions")
        .document(user.email)
        .collection(user.email)
        .document(action.id);
    var date = DateTime.now();
    var start = action.startTime.split(":");
    var duration = ((date.hour - int.parse(start[0])) * 60) +
        (date.minute - int.parse(start[1]));
    documentReference.updateData({
      "breakEndTime": "${date.hour} : ${date.minute}",
      "breakDuration": duration
    });
  }
}
