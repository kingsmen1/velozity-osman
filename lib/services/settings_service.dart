import 'package:hive/hive.dart';
import 'package:velozity_assesment/constants/constants.dart';

class SettingsService {
  static const _darkModeKey = 'darkMode';

  final Box _box = Hive.box<bool>(Constants.settings);

  bool get isDarkMode => _box.get(_darkModeKey, defaultValue: false);

  Future<void> setDarkMode(bool enabled) async {
    await _box.put(_darkModeKey, enabled);
  }
}
