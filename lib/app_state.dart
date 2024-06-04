import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _userPreference = [];
  List<String> get userPreference => _userPreference;
  set userPreference(List<String> value) {
    _userPreference = value;
  }

  void addToUserPreference(String value) {
    _userPreference.add(value);
  }

  void removeFromUserPreference(String value) {
    _userPreference.remove(value);
  }

  void removeAtIndexFromUserPreference(int index) {
    _userPreference.removeAt(index);
  }

  void updateUserPreferenceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _userPreference[index] = updateFn(_userPreference[index]);
  }

  void insertAtIndexInUserPreference(int index, String value) {
    _userPreference.insert(index, value);
  }
}
