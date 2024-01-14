import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_task/core/cubit/app_cubit/app_cubit.dart';
import 'package:quran_task/core/cubit/app_states/app_states/app_state.dart';
import 'package:quran_task/core/shared/shared/constants/constants.dart';
import 'package:quran_task/features/home/widgets/custom_overlay.dart';

/// Quran Page Item
class CarouselItem extends StatelessWidget {
  const CarouselItem(
      {Key? key, required this.pageImagePath})
      : super(key: key);

  final String pageImagePath;
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                  height: portraitScreenHeight(context),
                  child: CustomOverlay(dimensions: cubit.overlays ?? [])),
              Image.asset(
                "assets/images/Quran-frame.png",
                fit: BoxFit.fill,
                height: portraitScreenHeight(context),
              ),
              Image.asset(
                pageImagePath,
                fit: BoxFit.fill,
                height: portraitScreenHeight(context),
              ),
            ],
          ),
        ),
      );
    });
  }
}
