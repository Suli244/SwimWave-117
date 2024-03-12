import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/con_bar.dart';
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SwBottomBar(),
                    ),
                    (protected) => false,
                  );
                  print('Premium');
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
                  print('X');
                },
              ),
              SizedBox(height: 12.h),
              RestoreButtons(
                onPressTermOfService: () {
                  print('Term Of Service');
                },
                onPressRestorePurchase: () {
                  print('Restore Purchase');
                },
                onPressPrivacyPolicy: () {
                  print('Privacy Policy');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
