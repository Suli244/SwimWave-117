import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/con_bar.dart';
import 'package:swim_wave_117/core/swimwave_apsaksas.dart';
import 'package:swim_wave_117/core/swimwave_psascovas.dart';
import 'package:swim_wave_117/core/urls.dart';
import 'package:swim_wave_117/premium/widget/item_premi.dart';
import 'package:swim_wave_117/premium/widget/restore_widgets.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({
    super.key,
    this.isClose = false,
  });
  final bool isClose;
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  Future<void> swimwavePurchase() async {
    final swimwavePaywall =
        await SwimwaveAdapty().swimwaveGetPaywall(DocFF.slkdnvsdvsdv);
    if (swimwavePaywall == null) return;
    final swimwaveProducts =
        await SwimwaveAdapty().swimwaveGetPaywallProducts(swimwavePaywall);
    if (swimwaveProducts == null) return;
    if (kDebugMode) log('Swimwave');

    await SwimwaveAdapty().swimwaveMakePurchase(swimwaveProducts.first);
  }

  bool invjsdvsdvddd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/brImage.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              PremiItem(
                imag: 'assets/images/premium.png',
                tit: 'PREMIUM ACCESS',
                onPressed: () async {
                  setState(() => invjsdvsdvddd = true);
                  await swimwavePurchase();
                  final hasPremiumStatusSmartTrader =
                      await SwimwaveAdapty().swimwaveHasPremiumStatus();
                  if (hasPremiumStatusSmartTrader) {
                    await setSwimwavePichajs();
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SwBottomBar(),
                      ),
                      (route) => false,
                    );
                  }
                  setState(() => invjsdvsdvddd = false);
                },
                onPresseD: () {
                  if (widget.isClose) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SwBottomBar(),
                      ),
                      (protected) => false,
                    );
                  }
                }, prem: invjsdvsdvddd,
              ),
              SizedBox(height: 12.h),
              RestoreButtons(
                onPressTermOfService: () {},
                onPressRestorePurchase: () {
                  restoreSwimwavePichajs(context);
                },
                onPressPrivacyPolicy: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
