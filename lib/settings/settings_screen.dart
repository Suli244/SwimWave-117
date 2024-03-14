import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/core/swimwave_psascovas.dart';
import 'package:swim_wave_117/core/urls.dart';
import 'package:swim_wave_117/core/web_view_plink.dart';
import 'package:swim_wave_117/onboarding/btn_mod_wid.dart';
import 'package:swim_wave_117/premium/preeeeemcaslkna.dart';

class SettingsSreen extends StatelessWidget {
  const SettingsSreen({super.key});
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SwMotion(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 24.w,
                        color: SwColors.blue1,
                      ),
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 27.w)
                  ],
                ),
                SizedBox(height: 20.h),
                FutureBuilder(
                    future: getSwimwavePichajs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && !snapshot.data!) {
                        return Column(
                          children: [
                            SwMotion(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Preeeeemcaslkna(
                                      isClose: true,
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/premiumOnPre.png',
                              ),
                            ),
                            SizedBox(height: 12.h),
                            BtnModWidget(
                                onPressed: () {
                                  restoreSwimwavePichajs(context);
                                },
                                text: 'Restore purchase'),
                            SizedBox(height: 12.h),
                          ],
                        );
                      }
                      return const SizedBox();
                    }),
                BtnModWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebSw(
                            title: 'Privacy policy',
                            url: DocFF.pP,
                          ),
                        ),
                      );
                    },
                    text: 'Privacy policy'),
                SizedBox(height: 12.h),
                BtnModWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebSw(
                            title: 'Terms of use',
                            url: DocFF.tUse,
                          ),
                        ),
                      );
                    },
                    text: 'Terms of use'),
                SizedBox(height: 12.h),
                BtnModWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebSw(
                            title: 'Support',
                            url: DocFF.s,
                          ),
                        ),
                      );
                    },
                    text: 'Support'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
