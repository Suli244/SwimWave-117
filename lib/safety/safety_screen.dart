import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swim_wave_117/core/sw_colors.dart';
import 'package:swim_wave_117/core/sw_motin.dart';
import 'package:swim_wave_117/fitness/detail_description/detail_description.dart';
import 'package:swim_wave_117/safety/safety_tips.dart';
import 'package:swim_wave_117/safety/safety_txt.dart';
import 'package:swim_wave_117/safety/widgets/safety_widget.dart';
import 'package:swim_wave_117/settings/settings_screen.dart';

class SafetySreen extends StatelessWidget {
  const SafetySreen({super.key});
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
                    SizedBox(width: 24.w),
                    Text(
                      'Safety',
                      style: TextStyle(
                        color: SwColors.whate,
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SwMotion(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsSreen(),
                            ));
                      },
                      child: Image.asset(
                        'assets/icons/icon_setting.png',
                        width: 24.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          'Learning to swim',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: SwColors.blue2.withOpacity(0.5),
                        ),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailDescription(
                                  titleApDetail: 'Learning to swim',
                                  title: 'Overcome Fear',
                                  url:
                                      'https://youtu.be/lUEM1ZxtuGc?si=Y44FLjLBmsOmalpz',
                                  des:
                                      '''Overcoming the fear of swimming is a common challenge, but with patience, gradual exposure, and positive reinforcement, many people can conquer this fear and enjoy the benefits of swimming. Here's a detailed guide on overcoming the fear of swimming:

1. Understand the Fear:
Identify the specific aspects of swimming that trigger fear. It could be fear of water, fear of drowning, or fear of not being able to breathe.

2. Take Small Steps:
Start by getting comfortable in the water without the pressure of swimming. Stand in shallow water, allowing yourself to feel the water on your skin and gradually acclimating to the sensations.

**3. Breath Control Practice:
Practice breathing exercises outside of the water to build confidence in controlling your breath. Slow, deep breaths can help calm anxiety.''',
                                ),
                              ),
                            );
                          },
                          title: 'Overcome Fear',
                          subTitle:
                              'Acknowledge any fears you may have about the water. Start by getting comfortable in shallow water and gradually progressing to deeper areas.',
                        ),
                        SizedBox(height: 12.h),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[0],
                                ),
                              ),
                            );
                          },
                          title: 'Get the Right Gear',
                          subTitle:
                              'Invest in comfortable swimwear and goggles. Goggles will help you keep your eyes open underwater and protect them from chlorine or saltwater.',
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Safety tips',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: SwColors.blue2.withOpacity(0.5),
                        ),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[1],
                                ),
                              ),
                            );
                          },
                          title: 'Use Life Jackets',
                          subTitle:
                              'Inexperienced swimmers, children, and individuals who are not confident in their swimming abilities should wear U.S. Coast Guard-approved life jackets.',
                        ),
                        SizedBox(height: 12.h),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[2],
                                ),
                              ),
                            );
                          },
                          title: 'Buddy System',
                          subTitle:
                              'Always swim with a buddy, especially in open water. Keep an eye out for each other and be prepared to assist if needed.',
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Instructions on what to do in case of emergency',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: SwColors.blue2.withOpacity(0.5),
                        ),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[3],
                                ),
                              ),
                            );
                          },
                          title: 'Assess the Situation',
                          subTitle:
                              'Quickly evaluate the situation to determine the type of emergency and the level of danger.',
                        ),
                        SizedBox(height: 12.h),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[4],
                                ),
                              ),
                            );
                          },
                          title: 'Call for Help',
                          subTitle:
                              'Dial the emergency services number in your country (e.g., 911 in the United States, 999 in the United Kingdom, 112 in many European countries). Provide essential information such as your location, the nature of the emergency, and any details about injuries or hazards.',
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'FAQ',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: SwColors.blue2.withOpacity(0.5),
                        ),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[5],
                                ),
                              ),
                            );
                          },
                          title: 'Can I swim after eating?',
                          subTitle:
                              'Its generally safe to swim after a light meal, but wait at least 30 minutes to avoid discomfort. Heavy meals may cause cramping.',
                        ),
                        SizedBox(height: 12.h),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[6],
                                ),
                              ),
                            );
                          },
                          title: 'How do I overcome fear of water or swimming?',
                          subTitle:
                              'ake lessons from a patient instructor. Start in shallow water and progress gradually.',
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Radiation & sun protection',
                          style: TextStyle(
                            color: SwColors.whate,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(
                          color: SwColors.blue2.withOpacity(0.5),
                        ),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[7],
                                ),
                              ),
                            );
                          },
                          title: 'Understanding UV Radiation',
                          subTitle:
                              'The sun emits different types of radiation, with UV radiation being a significant concern. UV radiation is categorized into UVA, UVB, and UVC. UVA and UVB can penetrate the',
                        ),
                        SizedBox(height: 12.h),
                        SafetyWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTips(
                                  model: listSafety[8],
                                ),
                              ),
                            );
                          },
                          title: 'Sunscreen Usage',
                          subTitle:
                              'Use a broad-spectrum sunscreen that protects against both UVA and UVB rays. Apply sunscreen with a Sun Protection Factor (SPF) of at least 30',
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
