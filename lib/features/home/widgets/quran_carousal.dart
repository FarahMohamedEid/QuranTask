import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_task/core/cubit/app_cubit/app_cubit.dart';
import 'package:quran_task/core/cubit/app_states/app_states/app_state.dart';
import 'package:quran_task/core/shared/shared/constants/constants.dart';
import 'package:quran_task/features/home/widgets/carousel_item.dart';

class QuranCarousal extends StatelessWidget {
  const QuranCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    cubit.startAudio(audioPath: pagesAudio[0]);
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context , state) {
        return CarouselSlider(
          options: CarouselOptions(
            height: portraitScreenHeight(context),
            viewportFraction: 1, // Display one page at a time
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              if(cubit.currentPlayer.stopped){
                cubit.changePage(index);
              }else{
                cubit.changePage(index, autoStart: true);
              }
            },
          ),
          carouselController: cubit.pageCarouselController,
          items: [
            for (var i = 0; i < pagesImages.length; i++)
            CarouselItem(
              pageImagePath: pagesImages[i],
            ),
          ],
        );
      }
    );
  }
}
