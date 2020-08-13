import './solo_action.dart';

class User {
  final String email;
  final String jobTitle;
  final String userName;
  String imgUrl;
  List<SoloAction> soloActions = [];

  User({
    this.imgUrl,
    this.email,
    this.jobTitle,
    this.userName,
    this.soloActions,
  });
}
