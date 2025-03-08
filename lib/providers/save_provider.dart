// providers/save_provider.dart
import 'package:belajarin_app/models/classes.dart';
import 'package:flutter/material.dart';

class SaveProvider extends ChangeNotifier {
  final List<AllClass> _savedItems = [];

  List<AllClass> get savedItems => _savedItems;

  bool isSaved(AllClass item) {
    return _savedItems.contains(item);
  }

  void toggleSaved(AllClass item) {
    if (isSaved(item)) {
      _savedItems.remove(item);
    } else {
      _savedItems.add(item);
    }
    notifyListeners();
  }
}
