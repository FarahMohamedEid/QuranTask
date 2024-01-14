abstract class AppStates {}

class AppInitialState extends AppStates {}

/// database states
class AppGetDataFromDbState extends AppStates {}
class AppErrorGetDataFromDbState extends AppStates {}

/// carousel states
class ChangePageState extends AppStates {}

/// audio states
class StartAudioState extends AppStates {}
class StopAudioState extends AppStates {}
class PlayAudioState extends AppStates {}

/// overlay states
class GetOverlayDimensionsState extends AppStates {}
class StopOverlayDimensionsState extends AppStates {}

