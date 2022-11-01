import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:open_resto/utils/background_service.dart';
import 'package:open_resto/utils/date_time_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPageController extends GetxController {
  final RxBool _isEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getInitialSetting();
  }

  bool get isEnabled => _isEnabled.value;

  void _getInitialSetting() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final notification = prefs.getBool('notification_permission');
    if (notification != null) {
      _isEnabled.value = notification;
    } else {
      _isEnabled.value = false;
    }
  }

  Future<bool> toggleSwitch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isEnabled.value = !_isEnabled.value;
    prefs.setBool('notification_permission', _isEnabled.value);
    if (_isEnabled.value) {
      return await AndroidAlarmManager.periodic(
          const Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed('/login');
  }
}
