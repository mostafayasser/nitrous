import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import './solo_action.dart';

class User {
  final String email;
  final String jobTitle;
  final Image profileImg;
  final String userName;
  String imgUrl;
  List<SoloAction> soloActions;

  User({
    this.imgUrl,
    this.email,
    this.jobTitle,
    this.profileImg,
    this.userName,
    this.soloActions,
  });

  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadPic() async {
    //Get the file from the image picker and store it
    final file = ImagePicker();
    PickedFile pickedImage = await file.getImage(source: ImageSource.gallery);
    File image = File(pickedImage.path);

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("images/$email");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    if (uploadTask.isInProgress) {
      print("loading");
    } else if (uploadTask.isComplete) {
      this.imgUrl = (await reference.getDownloadURL()).toString();
    }
  }
}
