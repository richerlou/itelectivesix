import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this.locator);

  final Locator locator;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

//   Future<void> signInAnonymously() async {
//     _setLoading();
//     await locator<Firebase_Authentication>().signInAnonymously();
//     _setNotLoading();
//   }

//   void _setLoading() {
//     _isLoading = true;
//     notifyListeners();
//   }

//   void _setNotLoading() {
//     _isLoading = false;
//     notifyListeners();
//   }
}