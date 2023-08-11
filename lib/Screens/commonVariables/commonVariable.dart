import 'dart:core';

import 'package:flutter/material.dart';
import '../OutputScreen/Serves/all_function.dart';

TimeOfDay startTime = TimeOfDay(hour: 8, minute: 30);
TimeOfDay endTime = TimeOfDay(hour: 8, minute: 30);
bool emojiDisplay = true;
bool textDisplay = true;
bool dengerDisplay = true;
bool normalDisplay = true;
bool vibrationMood = true;
bool buttonClicked = false;
bool isRecording = false;
bool isSleepMood = false;
List<Pair<String, DateTime>> detectedDangersList = [];
List<Pair<String, DateTime>> detectedNormalDangerList = [];
List<Pair<String, DateTime>> detectedNormalList = [];
