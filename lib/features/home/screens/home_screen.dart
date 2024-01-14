import 'package:flutter/material.dart';
import 'package:quran_task/features/home/widgets/land_scape_screen.dart';
import 'package:quran_task/features/home/widgets/portrait_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
            // OrientationBuilder is used to detect the screen orientation
            child: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait ?
                const PortraitScreen()
                    :
                const LandScapeScreen();
              },
            ),
          ),
          ),
    );
  }
}
