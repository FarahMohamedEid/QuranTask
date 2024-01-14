import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_task/core/cubit/app_cubit/app_cubit.dart';
import 'package:quran_task/core/cubit/app_states/app_states/app_state.dart';
import 'package:quran_task/core/shared/shared/widgets/app_button.dart';

class StopBtn extends StatelessWidget {
  const StopBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
        builder: (context , state) {
          var cubit = AppCubit.get(context);
          return Expanded(
            child: AppButton(
              title: 'Stop',
              onPressed: (){
                cubit.stopAudio();
                cubit.stopOverlay();
              },
            ),
          );
        }
    );

  }
}
