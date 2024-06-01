import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _displayName = prefs.getString('ff_displayName') ?? _displayName;
    });
    _safeInit(() {
      _userPreference =
          prefs.getStringList('ff_userPreference') ?? _userPreference;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
    prefs.setString('ff_displayName', value);
  }

  List<String> _userPreference = [];
  List<String> get userPreference => _userPreference;
  set userPreference(List<String> value) {
    _userPreference = value;
    prefs.setStringList('ff_userPreference', value);
  }

  void addToUserPreference(String value) {
    _userPreference.add(value);
    prefs.setStringList('ff_userPreference', _userPreference);
  }

  void removeFromUserPreference(String value) {
    _userPreference.remove(value);
    prefs.setStringList('ff_userPreference', _userPreference);
  }

  void removeAtIndexFromUserPreference(int index) {
    _userPreference.removeAt(index);
    prefs.setStringList('ff_userPreference', _userPreference);
  }

  void updateUserPreferenceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _userPreference[index] = updateFn(_userPreference[index]);
    prefs.setStringList('ff_userPreference', _userPreference);
  }

  void insertAtIndexInUserPreference(int index, String value) {
    _userPreference.insert(index, value);
    prefs.setStringList('ff_userPreference', _userPreference);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
