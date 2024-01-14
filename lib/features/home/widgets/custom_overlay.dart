import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_task/core/cubit/app_cubit/app_cubit.dart';
import 'package:quran_task/core/cubit/app_states/app_states/app_state.dart';
import 'package:quran_task/core/models/ar_overlay_model.dart';
import 'package:quran_task/core/shared/shared/colors/colors_manager.dart';

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({Key? key, required this.dimensions}) : super(key: key);

  final List<OverlayTest> dimensions;
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight= MediaQuery.sizeOf(context).height;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {
        if (state is GetOverlayDimensionsState) {
          cubit.getNewOverlayDimensionsByDuration();
        }

      },
      builder: (context,state) {
        return Stack(
          children: dimensions.map((dimension) {
            return Positioned(
              left: (dimension.x ?? 0) * (screenWidth /720),
              top:  (dimension.y ?? 0) *(screenHeight / 1200),
              width: (dimension.w ?? 0) *(screenWidth / 720),
              height: (dimension.h ?? 0) *(screenHeight / 1200),
              child: Container(
                color: ColorsManager.green.withOpacity(0.3),
              ),
            );
          }).toList(),
        );
      }
    );
  }
}