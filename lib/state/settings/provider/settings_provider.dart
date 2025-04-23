import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/services/settings_service.dart';

final settingsServiceProvider = Provider((ref) => SettingsService());

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  final service = ref.read(settingsServiceProvider);
  return DarkModeNotifier(service);
});

class DarkModeNotifier extends StateNotifier<bool> {
  final SettingsService _service;

  DarkModeNotifier(this._service) : super(_service.isDarkMode);

  void toggle() {
    state = !state;
    _service.setDarkMode(state);
  }
}
