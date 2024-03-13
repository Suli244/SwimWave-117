// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swim_wave_117/core/con_bar.dart';
import 'package:swim_wave_117/core/swimwave_apsaksas.dart';
import 'package:swim_wave_117/core/urls.dart';

Future<bool> getSwimwavePichajs() async {
  final vksddvs = await SharedPreferences.getInstance();
  return vksddvs.getBool('pijvdpsjivpdsjipsvdpid') ?? false;
}

Future<void> setSwimwavePichajs() async {
  final vksddvs = await SharedPreferences.getInstance();
  vksddvs.setBool('pijvdpsjivpdsjipsvdpid', true);
}

Future<void> restoreSwimwavePichajs(BuildContext context) async {
  final currencyAdaptyRestoreResult =
      await SwimwaveAdapty().swimwaveRestorePurchases();
  if (currencyAdaptyRestoreResult?.accessLevels['premium']?.isActive ?? false) {
    final vksddvs = await SharedPreferences.getInstance();
    vksddvs.setBool("pijvdpsjivpdsjipsvdpid", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SwBottomBar()),
      (route) => false,
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to currencySupport: ${DocFF.s}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
