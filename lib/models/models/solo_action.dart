import 'package:flutter/material.dart';
import 'package:nitrous/models/models/subTopic.dart';
import 'package:nitrous/models/models/topic.dart';

enum Status { Ongoing, Done }

abstract class SoloAction {
  final String id;
  final String title;
  final Topic topic;
  final SubTopic subTopic;
  final DateTime date;
  final int duration;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String userID;
  final double factor;
  final Status status;

  SoloAction({
    this.id,
    this.subTopic,
    this.topic,
    this.factor,
    this.title,
    this.date,
    this.duration,
    this.userID,
    this.startTime,
    this.endTime,
    this.status,
  });

  void start();
  void end();
  void breakAction();
}
