import 'dart:convert';

import 'package:flutter_interview_quetion/shared/shared_ref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  Future<void> setList(List favorite) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKeys.favoriteList, jsonEncode(favorite));
  }
}
