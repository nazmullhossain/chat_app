import '../model/user_model.dart';

class GlobalWidget {
  static List<UserModel> dummyUsers = [];
  static UserModel? loggedInUser;
  static UserModel? toChatUser;

  static void initDummyUsers() {
    UserModel userModelA =
        UserModel(id: 1000, name: "A", email: " testA@gmail.com");
    UserModel userModelB =
        UserModel(id: 1000, name: "B", email: " testB@gmail.com");

    dummyUsers.add(userModelA);
    dummyUsers.add(userModelB);
  }

  static List<UserModel> getUsersFor(UserModel userModel) {
    List<UserModel> filterUsers = dummyUsers!
        .where((element) => (!element.name!
            .toLowerCase()
            .contains(userModel.name!.toLowerCase())))
        .toList();
    return filterUsers;
  }
}
