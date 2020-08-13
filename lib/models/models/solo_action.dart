import 'package:flutter/material.dart';
import 'package:nitrous/models/models/subTopic.dart';
import 'package:nitrous/models/models/topic.dart';

class SoloAction {
  final String id;
  String title;
  Topic topic;
  SubTopic subTopic;
  final DateTime date;
  final String formatedDate;
  int duration;
  final String startTime;
  final String endTime;
  int breakDuration;
  String breakStartTime;
  String breakEndTime;
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
    this.breakDuration,
    this.breakStartTime,
    this.breakEndTime,
    this.userID,
    this.startTime,
    this.endTime,
    this.status,
  });
}
