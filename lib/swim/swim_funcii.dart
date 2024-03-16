import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:country_codes/country_codes.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

Future<bool> swimIsUsingVpn() async {
  var swimConnectivityResult = await (Connectivity().checkConnectivity());

  return swimConnectivityResult == ConnectivityResult.vpn;
}

Future<String> swimCountryCode() async {
  await CountryCodes.init();

  final Locale? swimDeviceLocale = CountryCodes.getDeviceLocale();

  if (swimDeviceLocale != null && swimDeviceLocale.countryCode != null) {
    return swimDeviceLocale.countryCode!.toLowerCase();
  }
  return '';
}

Future<bool> swimIsSemulator(BuildContext context) async {
  DeviceInfoPlugin swimDeviceInfoPlugin = DeviceInfoPlugin();
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo swimIosDeviceInfo = await swimDeviceInfoPlugin.iosInfo;
    return !swimIosDeviceInfo.isPhysicalDevice;
  }
  return false;
}

Future<int> swimBatteryLevel() async {
  final Battery swimBattery = Battery();
  try {
    int swimBatteryLevel = await swimBattery.batteryLevel;

    return swimBatteryLevel;
  } catch (e) {}
  return 0;
}

Future<bool> swimIsCharging() async {
  final Battery swimBattery = Battery();
  try {
    bool swimIsCharging = false;
    swimBattery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        swimIsCharging = true;
      }
    });
    return swimIsCharging;
  } catch (e) {
    throw Exception(e);
  }
}

Future<bool> swimIsInternetConnected() async {
  final FlutterNetworkConnectivity swimFlutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    lookUpDuration: const Duration(seconds: 5),
  );
  bool swimIsNetworkConnectedOnCall =
      await swimFlutterNetworkConnectivity.isInternetConnectionAvailable();
  return swimIsNetworkConnectedOnCall;
}

Future<void> swimBrowse(String ur) async {
  final url = Uri.parse(ur).normalizePath();
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Future<String> swimGetTime() async {
  tzdata.initializeTimeZones();

  tz.TZDateTime moscowTime = tz.TZDateTime.now(tz.getLocation('Europe/Moscow'));
  return DateTime(moscowTime.year, moscowTime.month, moscowTime.day,
          moscowTime.hour, moscowTime.minute)
      .toString();
}
