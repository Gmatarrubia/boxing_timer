class SystemModel {
  bool enableEditState = false;
  int currentRoundTime = 0;
  int currentRoundNum = 0;
  int roundType = 0;
  bool soundEnabled = false;

  String currentRoundIcon = "";

  bool? getEnableEditState() {
    return enableEditState;
  }

  changeEnableEditState() {
    enableEditState = !enableEditState;
  }

  setCurrentRoundNum(int newCurrentRoundNum) {
    currentRoundNum = newCurrentRoundNum;
  }

  int? getCurrentRoundNum() {
    return currentRoundNum;
  }

  Map toJson() => {
        'soundEnabled': soundEnabled,
      };

  SystemModel() {
    soundEnabled = false;
  }

  SystemModel.fromJson(Map json) : soundEnabled = json['soundEnabled'];
}
