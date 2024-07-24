import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';

class appData {
  static UserModel me = UserModel(
      name: "name",
      userName: " userName",
      password: "password",
      id: "id",
      tall: 0,
      weight: 0,
      age: 0,
      goal: "goal",
      dailyActive: 0,
      myDietMales: []);
  static int pageIndex = 1;
  static int getPageIndex() => pageIndex;
  static void setPageIndex(int i) => pageIndex = i;

  static String mainGif = "";
  static String getMainGif() => mainGif;
  static void setMainGif(String i) => mainGif = i;

  static setUserModel(UserModel m) {
    me = m;
  }

  static UserModel getUserModel() {
    return me;
  }
}
