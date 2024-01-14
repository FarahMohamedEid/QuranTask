import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_task/core/cubit/app_states/app_states/app_state.dart';
import 'package:quran_task/core/models/ar_overlay_model.dart';
import 'package:quran_task/core/models/db_model.dart';
import 'package:quran_task/core/network/dataBase/data_base.dart';
import 'package:quran_task/core/shared/shared/constants/constants.dart';
import 'package:quran_task/core/shared/shared/extension/extension_manager.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  /// database
  late DbModel dataBase;
  Future<void> getDataFromDb() async {
    await DatabaseHelper().initializeDatabase().then(
      (value) {
        dataBase = value;
        debugPrint('getDataFromDb => ${dataBase.arOverlayModels?.length}');
        emit(AppGetDataFromDbState());
      },
    ).catchError((error){
      debugPrint('error => $error');
      emit(AppErrorGetDataFromDbState());
    });
  }

  /// carousel of pages
  CarouselController pageCarouselController = CarouselController();
  void changePage(int index , {bool? autoStart}) {
    pageCarouselController.animateToPage(
      index,
    );
    stopAudio();
    startAudio(audioPath: pagesAudio[index]);
    emit(ChangePageState());
  }

  /// audio
  final AssetsAudioPlayer currentPlayer = AssetsAudioPlayer();
  void startAudio({required String audioPath , bool? autoStart}) async {
    await currentPlayer.open(
      Audio(audioPath),
      autoStart: autoStart ?? false,
      showNotification: true,
    );
    emit(StartAudioState());
  }
  void stopAudio() async {
    await currentPlayer.stop();
    emit(StopAudioState());
  }
  void playAudio() async {
    await currentPlayer.play();
    emit(PlayAudioState());
  }

  /// overlay

  bool isShowOverlay = false;
  stopOverlay() {
    isShowOverlay = true;
    overlays = [];
    emit(StopOverlayDimensionsState());
  }

  getNewOverlayDimensionsByDuration() {
    if(!isShowOverlay){
      Duration duration = parseDuration(dataBase.hafsAlmuaiqlyModels?[currentIndexOverlays].duration);
      Future.delayed(duration , () {
        currentIndexOverlays++;
        getOverlayDimensions();
      });
    }
  }

  List<OverlayTest>? overlays;
  int currentIndexOverlays = 0;
  getOverlayDimensions() {
    int ayahId = dataBase.hafsAlmuaiqlyModels?[currentIndexOverlays].ayahId ?? 0;
    dataBase.arOverlayModels?.forEach((element) {
      if (element.ayahId == ayahId) {
        overlays = element.overlay;
      }
    });
    emit(GetOverlayDimensionsState());
  }


}
