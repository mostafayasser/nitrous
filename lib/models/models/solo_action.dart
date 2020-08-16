import 'package:nitrous/models/models/subTopic.dart';
import 'package:nitrous/models/models/topic.dart';

class SoloAction {
  final String id;
  String title;
  Topic topic;
  SubTopic subTopic;
  final DateTime date;
  final String formatedDate;
  final int day;
  final int month;
  final int year;
  int duration;
  final int startHour;
  final int startMin;
  final int endHour;
  final int endMin;
/*   int breakDuration;
  String breakStartTime;
  String breakEndTime; */
  final String userID;
  final double factor;
  String status;

  SoloAction({
    this.id,
    this.subTopic,
    this.topic,
    this.factor,
    this.title,
    this.date,
    this.formatedDate,
    this.duration,
/*     this.breakDuration,
    this.breakStartTime,
    this.breakEndTime, */
    this.userID,
    this.startHour,
    this.startMin,
    this.endHour,
    this.endMin,
    this.day,
    this.month,
    this.year,
    this.status,
  });
}
