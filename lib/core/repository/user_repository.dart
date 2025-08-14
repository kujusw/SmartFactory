import '../../models/user.dart';
import '../preferences/preferences.dart';

class UserRepository {
  UserRepository(this._preferences);

  final Preferences _preferences;

  Future<UserLoginResponseEntity?> getLanguage() => _preferences.getUser();

  Future<bool> setLanguage(UserLoginResponseEntity user) => _preferences.setUser(user);
}
