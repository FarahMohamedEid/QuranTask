import 'package:flutter/material.dart';
import 'package:quran_task/features/home/widgets/play_audio_btn.dart';
import 'package:quran_task/features/home/widgets/quran_carousal.dart';
import 'package:quran_task/features/home/widgets/stop_btn.dart';

class PortraitScreen extends StatelessWidget {
  const PortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuranCarousal(),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              PlayAudioBtn(),
              SizedBox(width: 10,),
              StopBtn(),
            ],
          ),
        ),
      ],
    );
  }
}
