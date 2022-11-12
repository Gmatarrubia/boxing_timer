import 'package:flutter_test/flutter_test.dart';
import 'package:boxing_timer/models/system_model.dart';

void main() {
  test('Set new number of round in model', () {
    SystemModel model = SystemModel();
    expect(model.getCurrentRoundNum(), 0);

    int newCurrentRound = 10;
    model.setCurrentRoundNum(newCurrentRound);
    expect(model.getCurrentRoundNum(), newCurrentRound);
  });

}
