import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

List<CharactersRecord>? filterCharacters(
  List<CharactersRecord> inputCharacters,
  List<String> userPreference,
) {
  List<CharactersRecord> charRecords = [];

  for (CharactersRecord char in inputCharacters) {
    bool isNolifili = char.isNolifili;
    String charOrigin = char.characterOrigin;

    if (userPreference.contains(charOrigin) || isNolifili) {
      charRecords.add(char);
    }
  }
  if (charRecords.length >= 0) {
    return charRecords;
  } else {
    return null;
  }
}

bool showRefreshBtn(
  List<CharactersRecord> characterDocs,
  List<String> userPreference,
) {
  bool show = true;
  for (CharactersRecord char in characterDocs) {
    bool isNolifili = char.isNolifili;
    String charOrigin = char.characterOrigin;

    if (userPreference.contains(charOrigin) || isNolifili) {
      show = false;
      break;
    }
  }
  return show;
}

bool checkPreference(
  List<String> userPreference,
  String preference,
) {
  if (userPreference.contains(preference)) {
    return true;
  } else {
    return false;
  }
}
