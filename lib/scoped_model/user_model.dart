import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  // User _currentUser;

  String _email;

  String _password;

  String _userId;

  double _lat = 0;

  double _lng = 0;

  // User get currentUser => _currentUser;

  String get email => _email;

  String get passowrd => _password;

  String get userId => _userId;

  double get lat => _lat;

  double get lng => _lng;

  // void setUser(User _currentUser) {
  //   this._currentUser = _currentUser;
  //   notifyListeners();
  // }

  void updateUserId(String _userId) {
    this._userId = _userId;
    notifyListeners();
  }

  void updateEmail(String _email) {
    this._email = _email;
    notifyListeners();
  }

  void updatePassword(String _password) {
    this._password = _password;
    notifyListeners();
  }

  void updateLat(double lat) {
    this._lat = lat;
    notifyListeners();
  }

  void updateLng(double lng) {
    this._lng = lng;
    notifyListeners();
  }
}
